module FIFO_MEM #(parameter WIDTH = 8, DEPTH = 8)(
    input       logic                                    i_wclk,
    input       logic                                    i_rclk,
    input       logic                                    i_reset_n,
    input       logic                                    i_wr_en,
    input       logic                                    i_full,
    input       logic                                    i_empty,
    input       logic                                    i_rd_en,
    input       logic        [$clog2(DEPTH)-1:0]         i_wrddr,
    input       logic        [$clog2(DEPTH)-1:0]         i_rdaddr,
    input       logic        [WIDTH-1:0]                 i_DATA,
    output      logic        [WIDTH-1:0]                 o_DATA
);

reg         [WIDTH-1:0]         MEM         [0:DEPTH-1];


always_ff @(posedge i_wclk or negedge i_reset_n) begin
    if (!i_reset_n) begin
        for(int i = 0; i < DEPTH; i = i + 1) begin
            MEM[i] <= 0;
        end
    end
    else if(i_wr_en && !i_full)begin
        MEM[i_wrddr] <= i_DATA;
    end
end

always_ff @(posedge i_rclk or negedge i_reset_n) begin
    if (!i_reset_n) begin
        o_DATA <= 0;
    end
    else if(i_rd_en && !i_empty)begin
        o_DATA <= MEM[i_rdaddr];
    end
end

// assign o_DATA = MEM[i_rdaddr];
    
endmodule
module FIFO_empty #(parameter DEPTH = 8)(
    input        logic                                  i_rclk,
    input        logic                                  i_reset_n,
    input        logic                                  i_rd_en,
    input        logic       [$clog2(DEPTH):0]          i_wptr,
    output       logic        [$clog2(DEPTH):0]          o_raddr,
    output       logic       [$clog2(DEPTH):0]          o_rptr,
    output       logic                                   o_UV,
    output       logic                                  o_empty
);


// logic    [$clog2(DEPTH):0]     raddrPLUS1 = o_raddr + 1;


assign o_rptr = (o_raddr>>1) ^ o_raddr;

assign o_empty = i_wptr == o_rptr;


always_ff @(posedge i_rclk or negedge i_reset_n) begin
    if(!i_reset_n) begin
        o_raddr <= 0;
    end
    else if(i_rd_en && !o_empty) begin
        o_raddr <= o_raddr + 1;
    end
end


always_ff @(posedge i_rclk or negedge i_reset_n) begin : UV_FLAG
    if(!i_reset_n) begin
        o_UV <= 0;
    end
    else if(i_rd_en && o_empty) begin
        o_UV <= 1;
    end
    else begin
        o_UV <= 0;
    end
end

    
endmodule //moduleName

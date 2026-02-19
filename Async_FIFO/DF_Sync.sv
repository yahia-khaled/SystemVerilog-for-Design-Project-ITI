module DF_Sync #(parameter WIDTH = 1)(
    input       logic                        i_clk,
    input       logic                        i_reset_n,
    input       logic        [WIDTH-1:0]     i_async,
    output      logic        [WIDTH-1:0]     o_sync
);


logic    [WIDTH-1:0]       DFF_reg;

always_ff @(posedge i_clk or negedge i_reset_n) begin
    if(!i_reset_n) begin
        DFF_reg <= 0;
        o_sync <= 0;
    end
    else begin
        DFF_reg <= i_async;
        o_sync <= DFF_reg;
    end
end
    
endmodule
module clock_gating (
    input       logic                    i_clk,
    input       logic                    i_Enable,
    output      logic                    o_clk_gated
);


logic     latch_output;

always_latch begin
    if (!i_clk) begin
        latch_output <= i_Enable;
    end 
end

assign o_clk_gated = latch_output & i_clk;


endmodule
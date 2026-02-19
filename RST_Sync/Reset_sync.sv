module Reset_sync (
    input       logic           i_clk,
    input       logic           i_rst,
    output      logic           o_rst_sync
);


logic           rst_reg;

always_ff @(posedge i_clk, negedge i_rst) begin
    if (!i_rst) begin
        rst_reg <= 0;
        o_rst_sync <= 0;
    end
    else begin
        rst_reg <= 1;
        o_rst_sync <= rst_reg; 
    end
end
    
endmodule
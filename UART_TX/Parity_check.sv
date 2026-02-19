module Parity_check(
    input       logic                 i_clk,
    input       logic                 i_rst_n,
    input       logic                 i_Data_Valid,
    input       logic       [7:0]     i_P_DATA,
    input       logic                 i_PAR_TYP,
    output      logic                 o_par_bit
);


logic       [7:0]       Party_comb;

assign Party_comb = ^i_P_DATA;

always_ff @(posedge i_clk, negedge i_rst_n) begin
    if (!i_rst_n) begin
        o_par_bit <= 0;
    end
    else if(i_Data_Valid)begin
        if (i_PAR_TYP) begin
            o_par_bit = ~Party_comb;
        end
        else begin
            o_par_bit = Party_comb;
        end 
    end
end

endmodule
module parity_check(
    input           logic                       i_PAR_TYP,
    input           logic        [7:0]          i_P_DATA,
    input           logic                       i_sampled_bit,
    input           logic                       i_par_chk_en,
    output          logic                       o_par_err
);


logic Odd_Parity_bit;
logic Even_Parity_bit;

always_comb begin
    Odd_Parity_bit = ^i_P_DATA;
        Even_Parity_bit = ~ Odd_Parity_bit;


    if (i_PAR_TYP) begin
        
        if (i_par_chk_en) begin
            if (i_sampled_bit == Even_Parity_bit) begin
                o_par_err = 0;
            end
            else begin
                o_par_err = 1;
            end
        end
        else begin
            o_par_err = 0;
        end
    end
    else begin
        if (i_par_chk_en) begin
            if (i_sampled_bit == Odd_Parity_bit) begin
                o_par_err = 0;
            end
            else begin
                o_par_err = 1;
            end
        end
        else begin
            o_par_err = 0;
        end
    end
end
    
endmodule //moduleName

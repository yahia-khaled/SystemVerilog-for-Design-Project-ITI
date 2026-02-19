module Stop_check(
    input           logic                       i_stp_chk_en,
    input           logic                       i_sampled_bit,
    output          logic                       o_stp_err
);


assign o_stp_err = (i_stp_chk_en)? (i_sampled_bit != 1)? 1 : 0 : 0;
    
endmodule //moduleName

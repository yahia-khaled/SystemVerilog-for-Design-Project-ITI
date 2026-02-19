module strt_check(
    input           logic                       i_strt_chk_en,
    input           logic                       i_sampled_bit,
    output          logic                       o_strt_glitch
);


assign o_strt_glitch = (i_strt_chk_en)? (i_sampled_bit != 0)? 1 : 0 : 0;
    
endmodule //moduleName

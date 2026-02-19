module deserializer(
    input           logic                   i_clk,
    input           logic                   i_reset,
    input           logic                   i_deser_en,
    input           logic                   i_sampled_bit,
    output          logic       [7:0]       o_P_DATA
);



always_ff @(posedge i_clk, negedge i_reset) begin
    if (!i_reset) begin
        o_P_DATA <= 0;
    end
    else if(i_deser_en)begin
        o_P_DATA <= {i_sampled_bit, o_P_DATA[7:1]};
    end
end
    
endmodule //deserializer

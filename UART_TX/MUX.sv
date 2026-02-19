module MUX(
    input       logic                           i_I0,
    input       logic                           i_I1,
    input       logic                           i_I2,
    input       logic                           i_I3,
    input       logic           [1:0]           i_sel,
    output      logic                           o_TX_OUT
);


always_comb begin
    case (i_sel)
        2'b00: begin
            o_TX_OUT = i_I0;
        end
        2'b01: begin
            o_TX_OUT = i_I1;
        end
        2'b10: begin
            o_TX_OUT = i_I2;
        end
        2'b11: begin
            o_TX_OUT = i_I3;
        end
    endcase
end

    
endmodule
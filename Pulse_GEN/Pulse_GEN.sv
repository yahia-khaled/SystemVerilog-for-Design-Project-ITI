module Pulse_GEN (
    input               logic                       i_in,
    input               logic                       i_clk,
    input               logic                       i_rst,
    output              logic                       o_pulse
);


logic           pulse_gen_reg;

always_ff @(posedge i_clk, negedge i_rst) begin
    if (!i_rst) begin
       pulse_gen_reg <= 0; 
    end
    else begin
        // pulse_gen_reg <= {pulse_gen_reg[0], i_in};
        pulse_gen_reg <= i_in;
    end
end

assign o_pulse = i_in & ~pulse_gen_reg;
    
endmodule
module Data_sync #(parameter DATA_WIDTH = 8)(
    input       logic                                  i_clk,
    input       logic                                  i_reset,
    input       logic                                  i_Enable,
    input       logic         [DATA_WIDTH-1:0]         i_data,
    output      logic                                  o_valid,
    output      logic         [DATA_WIDTH-1:0]         o_data_sync
);


logic       Data_Enable_reg;
logic       Enable_pulse;


Pulse_GEN u_Pulse_GEN(
    .i_in    	(i_Enable     ),
    .i_clk   	(i_clk    ),
    .i_rst   	(i_reset    ),
    .o_pulse 	(Enable_pulse  )
);


always_ff @(posedge i_clk, negedge i_reset) begin
    if (!i_reset) begin
        Data_Enable_reg <= 0;
        o_valid <= 0;
        o_data_sync <= 0;
    end
    else begin
        Data_Enable_reg <= Enable_pulse;
        o_valid <= Data_Enable_reg;
        o_data_sync <= i_data;
    end
end



    
endmodule
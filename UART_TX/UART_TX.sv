module UART_TX(
    input       logic                   i_clk,
    input       logic                   i_rst_n,
    input       logic       [7:0]       i_P_DATA,
    input       logic                   i_Data_Valid,
    input       logic                   i_PAR_TYP,
    input       logic                   i_PAR_EN,
    output      logic                   o_TX_Out,
    output      logic                   o_busy
);
    
// output declaration of module FSM
logic [1:0] o_mux_sel;
logic o_ser_en;
// output declaration of module serializer
logic o_ser_data;
logic o_ser_done;
// output declaration of module Parity_check
logic o_par_bit;
logic o_TX_Out_2;


FSM u_FSM(
    .i_clk        	(i_clk         ),
    .i_rst_n      	(i_rst_n       ),
    .i_DATA_Valid 	(i_Data_Valid  ),
    .i_ser_done   	(o_ser_done    ),
    .i_PAR_EN     	(i_PAR_EN      ),
    .o_mux_sel    	(o_mux_sel     ),
    .o_ser_en     	(o_ser_en      ),
    .o_busy       	(o_busy        )
);



Parity_check u_Parity_check(
    .i_clk        	(i_clk         ),
    .i_rst_n      	(i_rst_n       ),
    .i_Data_Valid 	(i_PAR_EN  ),
    .i_P_DATA     	(i_P_DATA      ),
    .i_PAR_TYP    	(i_PAR_TYP     ),
    .o_par_bit    	(o_par_bit     )
);


serializer u_serializer(
    .i_clk      	(i_clk       ),
    .i_rst_n    	(i_rst_n     ),
    .i_P_DATA   	(i_P_DATA    ),
    .i_ser_en   	(o_ser_en    ),
    .o_ser_data 	(o_ser_data  ),
    .o_ser_done 	(o_ser_done  )
);


MUX u_MUX(
    .i_I0     	(1'b0      ),
    .i_I1     	(o_ser_data      ),
    .i_I2     	(o_par_bit      ),
    .i_I3     	(1'b1      ),
    .i_sel    	(o_mux_sel     ),
    .o_TX_OUT 	(o_TX_Out  )
);




endmodule //UART_TX

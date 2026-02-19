module UART_RX(
    input           logic                           i_clk,
    input           logic                           i_reset,
    input           logic                           i_rx_in,
    input           logic           [5:0]           i_Prescale,
    input           logic                           i_PAR_EN,
    input           logic                           i_PAR_TYP,
    output          logic                           o_data_valid,
    output          logic                           o_par_err,
    output          logic          [7:0]            o_P_DATA
);


// output declaration of module UART_RX_FSM
logic strt_check_en;
logic par_check_en;
logic stp_check_en;
logic enable_cnt;
logic deser_en;
logic data_samp_en;

// output declaration of module edge_bit_cnt
logic [3:0] bit_cnt;
logic [4:0] edge_cnt;

// output declaration of module data_sampling
logic sample_bit;
logic strt_glitch;
logic stp_err;


UART_RX_FSM u_UART_RX_FSM(
    .i_reset         	(i_reset          ),
    .i_clk           	(i_clk            ),
    .i_rx_in         	(i_rx_in          ),
    .i_PAR_EN        	(i_PAR_EN         ),
    .i_bit_cnt       	(bit_cnt        ),
    .i_edge_cnt      	(edge_cnt       ),
    .i_par_err       	(o_par_err        ),
    .i_Prescale 	    (i_Prescale  ),
    .i_stp_err       	(stp_err        ),
    .i_strt_glitch   	(strt_glitch    ),
    .o_strt_check_en 	(strt_check_en  ),
    .o_par_check_en  	(par_check_en   ),
    .o_stp_check_en  	(stp_check_en   ),
    .o_data_valid    	(o_data_valid     ),
    .o_enable_cnt    	(enable_cnt     ),
    .o_deser_en      	(deser_en       ),
    .o_data_samp_en  	(data_samp_en   )
);


edge_bit_cnt u_edge_bit_cnt(
    .i_clk      	(i_clk       ),
    .i_reset    	(i_reset     ),
    .i_enable   	(enable_cnt    ),
    .i_PAR_EN   	(i_PAR_EN    ),
    .i_Prescale 	(i_Prescale  ),
    .o_bit_cnt  	(bit_cnt   ),
    .o_edge_cnt 	(edge_cnt  )
);


data_sampling u_data_sampling(
    .i_clk          	(i_clk           ),
    .i_reset        	(i_reset         ),
    .i_rx_in        	(i_rx_in         ),
    .i_data_samp_en 	(data_samp_en  ),
    .i_Prescale     	(i_Prescale      ),
    .i_edge_cnt     	(edge_cnt      ),
    .o_sample_bit   	(sample_bit    )
);


deserializer u_deserializer(
    .i_clk         	(i_clk          ),
    .i_reset       	(i_reset        ),
    .i_deser_en    	(deser_en     ),
    .i_sampled_bit 	(sample_bit  ),
    .o_P_DATA      	(o_P_DATA       )
);


parity_check u_parity_check(
    .i_PAR_TYP     	(i_PAR_TYP      ),
    .i_P_DATA      	(o_P_DATA       ),
    .i_sampled_bit 	(sample_bit  ),
    .i_par_chk_en 	(par_check_en  ),
    .o_par_err     	(o_par_err      )
);


strt_check u_strt_check(
    .i_strt_chk_en 	(strt_check_en  ),
    .i_sampled_bit 	(sample_bit  ),
    .o_strt_glitch 	(strt_glitch  )
);


Stop_check u_Stop_check(
    .i_stp_chk_en  	(stp_check_en   ),
    .i_sampled_bit 	(sample_bit  ),
    .o_stp_err     	(stp_err      )
);


    
endmodule //UART_RX

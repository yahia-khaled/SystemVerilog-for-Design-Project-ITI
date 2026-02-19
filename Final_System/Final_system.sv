import myPkg::*;
module Final_system #(parameter REG_FILE_WIDTH = 8, REG_FILE_ADDRESS = 4, FIFO_DEPTH = 16)(
    input               logic                       i_ref_clk,
    input               logic                       i_UART_clk,
    input               logic                       i_reset,
    input               logic                       i_RX_in,
    output              logic                       o_par_err,
    output              logic                       o_TX_OUT
);

localparam ALU_WIDTH = REG_FILE_WIDTH*2;

// output declaration of module Reset_sync_UART
logic Sync_reset_UART;
// output declaration of module Reset_sync_SYS
logic Sync_reset_SYS;
// output declaration of module SYS_CTRL
ALU_FUN_t o_ALU_FUN;
logic o_Enable;
logic o_Clk_Enable;
logic [3:0] o_Address;
logic o_RdEn;
logic o_WrEn;
logic [REG_FILE_WIDTH-1:0] o_WrData;
logic [REG_FILE_WIDTH-1:0] o_TX_P_DATA;
logic o_TX_D_VLD;
logic o_clk_div_en;
// output declaration of module clk_div_UART_RX
logic RX_CLK;
// output declaration of module clk_div_UART_TX
logic UART_TX_CLK;
// output declaration of module UART_RX
logic data_valid_UART_RX;
logic [7:0] DATA_UART_RX;
// output declaration of module UART_TX
logic o_busy_UART_TX;
// output declaration of module Pulse_GEN
logic o_busy_pulse;
// output declaration of module Asynchronous_FIFO
logic [REG_FILE_WIDTH-1:0] o_Data_UART_TX;
logic o_full;
logic o_empty;
logic o_OF;
logic o_UV;
// output declaration of module Data_sync
logic data_valid_UART_RX_sync;
logic [7:0] DATA_UART_RX_sync;
// output declaration of module Reg_file
logic   [REG_FILE_WIDTH-1:0]    REG0;
logic   [REG_FILE_WIDTH-1:0]    REG1;
logic   [REG_FILE_WIDTH-1:0]    REG2;
logic   [REG_FILE_WIDTH-1:0]    REG3;
logic   [REG_FILE_WIDTH-1:0]    RdData;
logic                           RdData_valid;
// output declaration of module ALU
logic o_OUT_VALID;
logic [ALU_WIDTH-1:0] o_ALU_OUT;
// output declaration of module clock_gating
logic ALU_CLK;
// output declaration of module UART_RX_DEV_ratio
logic [REG_FILE_WIDTH-1:0] o_UART_RX_dev_ratio;



///////////////////////////////////////// Reset Sync UART instance //////////////////////////////////////

Reset_sync u_Reset_sync_UART(
    .i_clk      	(i_UART_clk       ),
    .i_rst      	(i_reset       ),
    .o_rst_sync 	(Sync_reset_UART  )
);

///////////////////////////////////////// Reset Sync SYS instance //////////////////////////////////////

Reset_sync u_Reset_sync_SYS(
    .i_clk      	(i_ref_clk       ),
    .i_rst      	(i_reset       ),
    .o_rst_sync 	(Sync_reset_SYS  )
);

///////////////////////////////////////// SYS CTRL instance //////////////////////////////////////
SYS_CTRL #(
    .ALU_OUT_WIDTH 	(ALU_WIDTH  ), .ADDRESS_BTIS(REG_FILE_ADDRESS))
u_SYS_CTRL(
    .i_clk          	(i_ref_clk           ),
    .i_reset        	(Sync_reset_SYS         ),
    .i_ALU_OUT      	(o_ALU_OUT       ),
    .i_OUT_VALID    	(o_OUT_VALID     ),
    .i_RdData_Valid 	(RdData_valid),
    .i_full_FIFO 	    (o_full),
    .i_RX_P_DATA    	(DATA_UART_RX_sync     ),
    .i_RX_D_VLD     	(data_valid_UART_RX_sync      ),
    .i_RdData       	(RdData        ),
    .o_ALU_FUN      	(o_ALU_FUN       ),
    .o_Enable       	(o_Enable        ),
    .o_Clk_Enable   	(o_Clk_Enable    ),
    .o_Address      	(o_Address       ),
    .o_RdEn         	(o_RdEn          ),
    .o_WrEn         	(o_WrEn          ),
    .o_WrData       	(o_WrData        ),
    .o_TX_P_DATA    	(o_TX_P_DATA     ),
    .o_TX_D_VLD     	(o_TX_D_VLD      ),
    .o_clk_div_en   	(o_clk_div_en    )
);


///////////////////////////////////////// MUX selects UART RX div ratio instance //////////////////////////////////////


UART_RX_DEV_ratio #(
    .DIV_RATIO_WIDTH 	(REG_FILE_WIDTH  ))
u_UART_RX_DEV_ratio(
    .i_prescale          	(REG2[7:2]           ),
    .o_UART_RX_dev_ratio 	(o_UART_RX_dev_ratio  )
);



///////////////////////////////////////// CLK DIV UART RX instance //////////////////////////////////////

clk_div #(
    .DIV_VAL_WIDTH 	(REG_FILE_WIDTH  ))
UART_RX_clk_div(
    .i_clk       	(i_UART_clk        ),
    .i_Enable    	(o_clk_div_en    ),
    .i_reset     	(Sync_reset_UART      ),
    .i_div_ratio 	(o_UART_RX_dev_ratio  ),
    .o_clk_div   	(RX_CLK    )
);


///////////////////////////////////////// CLK DIV UART TX instance //////////////////////////////////////

clk_div #(
    .DIV_VAL_WIDTH 	(REG_FILE_WIDTH  ))
UART_TX_clk_div(
    .i_clk       	(i_UART_clk        ),
    .i_Enable    	(o_clk_div_en     ),
    .i_reset     	(Sync_reset_UART      ),
    .i_div_ratio 	(REG3  ),
    .o_clk_div   	(UART_TX_CLK    )
);


///////////////////////////////////////// UART RX instance //////////////////////////////////////

UART_RX u_UART_RX(
    .i_clk        	(RX_CLK         ),
    .i_reset      	(Sync_reset_UART       ),
    .i_rx_in      	(i_RX_in       ),
    .i_Prescale   	(REG2[7:2]    ),
    .i_PAR_EN     	(REG2[0]      ),
    .i_PAR_TYP    	(REG2[1]     ),
    .o_data_valid 	(data_valid_UART_RX  ),
    .o_par_err    	(o_par_err     ),
    .o_P_DATA     	(DATA_UART_RX      )
);



///////////////////////////////////////// UART TX instance //////////////////////////////////////
UART_TX u_UART_TX(
    .i_clk        	(UART_TX_CLK         ),
    .i_rst_n      	(Sync_reset_UART       ),
    .i_P_DATA     	(o_Data_UART_TX),
    .i_Data_Valid 	(!o_empty ),
    .i_PAR_TYP    	(REG2[1]     ),
    .i_PAR_EN     	(REG2[0]      ),
    .o_TX_Out     	(o_TX_OUT      ),
    .o_busy       	(o_busy_UART_TX        )
);


///////////////////////////////////////// Pulse GEN instance //////////////////////////////////////

Pulse_GEN u_Pulse_GEN(
    .i_in    	(o_busy_UART_TX     ),
    .i_clk   	(UART_TX_CLK    ),
    .i_rst   	(Sync_reset_UART    ),
    .o_pulse 	(o_busy_pulse  )
);



///////////////////////////////////////// Async FIFO instance //////////////////////////////////////
Asynchronous_FIFO #(
    .WIDTH 	(REG_FILE_WIDTH   ),
    .DEPTH 	(FIFO_DEPTH  ))
u_Asynchronous_FIFO(
    .i_wclk    	(i_ref_clk     ),
    .i_rclk    	(UART_TX_CLK     ),
    .i_reset_n 	(Sync_reset_SYS  ),
    .i_wr_en   	(o_TX_D_VLD    ),
    .i_Data    	(o_TX_P_DATA     ),
    .i_rd_en   	(o_busy_pulse    ),
    .o_Data    	(o_Data_UART_TX     ),
    .o_full    	(o_full     ),
    .o_empty   	(o_empty    ),
    .o_OF      	(o_OF       ),
    .o_UV      	(o_UV       )
);




///////////////////////////////////////// Data Sync instance //////////////////////////////////////
Data_sync #(
    .DATA_WIDTH 	(8  ))
u_Data_sync(
    .i_clk       	(i_ref_clk        ),
    .i_reset     	(Sync_reset_SYS      ),
    .i_Enable    	(data_valid_UART_RX     ),
    .i_data      	(DATA_UART_RX       ),
    .o_valid     	(data_valid_UART_RX_sync      ),
    .o_data_sync 	(DATA_UART_RX_sync  )
);



///////////////////////////////////////// Reg File instance //////////////////////////////////////

RegFile #(  
    .ADDRESS_BTIS 	(REG_FILE_ADDRESS  ),
    .DATA_WIDTH   	(REG_FILE_WIDTH  ))
u_RegFile(
    .i_clk          	(i_ref_clk           ),
    .i_reset        	(Sync_reset_SYS         ),
    .i_Address      	(o_Address      ),
    .i_WrEn         	(o_WrEn         ),
    .i_RdEn         	(o_RdEn          ),
    .i_WrData       	(o_WrData       ),
    .o_RdData       	(RdData        ),
    .o_REG0         	(REG0          ),
    .o_REG1         	(REG1          ),
    .o_REG2         	(REG2          ),
    .o_REG3         	(REG3          ),
    .o_RdData_valid 	(RdData_valid  )
);

///////////////////////////////////////// Clock Gating instance //////////////////////////////////////
clock_gating u_clock_gating(
    .i_clk       	(i_ref_clk        ),
    .i_Enable    	(o_Clk_Enable     ),
    .o_clk_gated 	(ALU_CLK  )
);


///////////////////////////////////////// ALU instance //////////////////////////////////////
ALU #(
    .DATA_WIDTH 	(8           ),
    .OUT_WIDTH  	(ALU_WIDTH  ))
u_ALU(
    .i_clk       	(ALU_CLK        ),
    .i_reset     	(Sync_reset_SYS      ),
    .i_Enable    	(o_Enable     ),
    .i_ALU_FUN   	(o_ALU_FUN    ),
    .i_A         	(REG0          ),
    .i_B         	(REG1          ),
    .o_OUT_VALID 	(o_OUT_VALID  ),
    .o_ALU_OUT   	(o_ALU_OUT    )
);

    
endmodule //Final_system


package Pkg_sys_ctrl;
    typedef enum  {IDLE, RF_Wr_Data, RF_Wr_Addr, RF_Wr_CMD, RF_Rd_Addr, RF_Rd_CMD, ALU_FUN, Operand_B, Operand_A, ALU_OPER_W_OP_CMD, ALU_OPER_W_NOP_CMD, ALU_Result_byte0, ALU_Result_byte1, READ_RegFile_result, UART_TX_Send} Controller_state_t; 
endpackage  
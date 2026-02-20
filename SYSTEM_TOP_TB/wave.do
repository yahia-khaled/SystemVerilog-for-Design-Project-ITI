onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label sim:/SYS_TOP_TB/Group1 -group {Region: sim:/SYS_TOP_TB} /SYS_TOP_TB/RST_N
add wave -noupdate -label sim:/SYS_TOP_TB/Group1 -group {Region: sim:/SYS_TOP_TB} /SYS_TOP_TB/UART_CLK
add wave -noupdate -label sim:/SYS_TOP_TB/Group1 -group {Region: sim:/SYS_TOP_TB} /SYS_TOP_TB/REF_CLK
add wave -noupdate -label sim:/SYS_TOP_TB/Group1 -group {Region: sim:/SYS_TOP_TB} /SYS_TOP_TB/UART_RX_IN
add wave -noupdate -label sim:/SYS_TOP_TB/Group1 -group {Region: sim:/SYS_TOP_TB} /SYS_TOP_TB/UART_TX_O
add wave -noupdate -label sim:/SYS_TOP_TB/Group1 -group {Region: sim:/SYS_TOP_TB} /SYS_TOP_TB/parity_error
add wave -noupdate -label sim:/SYS_TOP_TB/Group1 -group {Region: sim:/SYS_TOP_TB} /SYS_TOP_TB/framing_error
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/i_ref_clk
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/i_UART_clk
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/i_reset
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/i_RX_in
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_par_err
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_TX_OUT
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/Sync_reset_UART
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/Sync_reset_SYS
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_ALU_FUN
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_Enable
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_Clk_Enable
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_Address
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_RdEn
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_WrEn
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_WrData
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_TX_P_DATA
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_TX_D_VLD
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_clk_div_en
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/RX_CLK
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/UART_TX_CLK
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/data_valid_UART_RX
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/DATA_UART_RX
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_busy_UART_TX
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_busy_pulse
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_Data_UART_TX
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_full
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_empty
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_OF
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_UV
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/data_valid_UART_RX_sync
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/DATA_UART_RX_sync
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/REG0
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/REG1
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/REG2
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/REG3
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/RdData
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/RdData_valid
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_OUT_VALID
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/o_ALU_OUT
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/Group1 -group {Region: sim:/SYS_TOP_TB/DUT} /SYS_TOP_TB/DUT/ALU_CLK
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_ALU/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_ALU} /SYS_TOP_TB/DUT/u_ALU/i_clk
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_ALU/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_ALU} /SYS_TOP_TB/DUT/u_ALU/i_reset
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_ALU/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_ALU} /SYS_TOP_TB/DUT/u_ALU/i_Enable
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_ALU/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_ALU} /SYS_TOP_TB/DUT/u_ALU/i_ALU_FUN
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_ALU/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_ALU} /SYS_TOP_TB/DUT/u_ALU/i_A
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_ALU/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_ALU} /SYS_TOP_TB/DUT/u_ALU/i_B
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_ALU/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_ALU} /SYS_TOP_TB/DUT/u_ALU/o_OUT_VALID
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_ALU/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_ALU} /SYS_TOP_TB/DUT/u_ALU/o_ALU_OUT
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_ALU/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_ALU} /SYS_TOP_TB/DUT/u_ALU/ALU_OUT_comb
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/i_wclk
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/i_rclk
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/i_reset_n
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/i_wr_en
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/i_Data
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/i_rd_en
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/o_Data
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/o_full
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/o_empty
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/o_OF
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/o_UV
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/o_waddr
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/o_wptr
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/o_wptr_sync
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/o_raddr
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/o_rptr
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Asynchronous_FIFO} /SYS_TOP_TB/DUT/u_Asynchronous_FIFO/o_rptr_sync
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_clock_gating/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_clock_gating} /SYS_TOP_TB/DUT/u_clock_gating/i_clk
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_clock_gating/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_clock_gating} /SYS_TOP_TB/DUT/u_clock_gating/i_Enable
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_clock_gating/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_clock_gating} /SYS_TOP_TB/DUT/u_clock_gating/o_clk_gated
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_clock_gating/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_clock_gating} /SYS_TOP_TB/DUT/u_clock_gating/latch_output
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Data_sync/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Data_sync} /SYS_TOP_TB/DUT/u_Data_sync/i_clk
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Data_sync/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Data_sync} /SYS_TOP_TB/DUT/u_Data_sync/i_reset
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Data_sync/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Data_sync} /SYS_TOP_TB/DUT/u_Data_sync/i_Enable
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Data_sync/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Data_sync} /SYS_TOP_TB/DUT/u_Data_sync/i_data
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Data_sync/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Data_sync} /SYS_TOP_TB/DUT/u_Data_sync/o_valid
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Data_sync/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Data_sync} /SYS_TOP_TB/DUT/u_Data_sync/o_data_sync
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Data_sync/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Data_sync} /SYS_TOP_TB/DUT/u_Data_sync/Data_Enable_reg
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Pulse_GEN/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Pulse_GEN} /SYS_TOP_TB/DUT/u_Pulse_GEN/i_in
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Pulse_GEN/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Pulse_GEN} /SYS_TOP_TB/DUT/u_Pulse_GEN/i_clk
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Pulse_GEN/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Pulse_GEN} /SYS_TOP_TB/DUT/u_Pulse_GEN/i_rst
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Pulse_GEN/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Pulse_GEN} /SYS_TOP_TB/DUT/u_Pulse_GEN/o_pulse
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Pulse_GEN/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Pulse_GEN} /SYS_TOP_TB/DUT/u_Pulse_GEN/pulse_gen_reg
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_RegFile/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_RegFile} /SYS_TOP_TB/DUT/u_RegFile/i_clk
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_RegFile/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_RegFile} /SYS_TOP_TB/DUT/u_RegFile/i_reset
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_RegFile/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_RegFile} /SYS_TOP_TB/DUT/u_RegFile/i_Address
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_RegFile/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_RegFile} /SYS_TOP_TB/DUT/u_RegFile/i_WrEn
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_RegFile/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_RegFile} /SYS_TOP_TB/DUT/u_RegFile/i_RdEn
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_RegFile/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_RegFile} /SYS_TOP_TB/DUT/u_RegFile/i_WrData
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_RegFile/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_RegFile} /SYS_TOP_TB/DUT/u_RegFile/o_RdData
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_RegFile/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_RegFile} /SYS_TOP_TB/DUT/u_RegFile/o_REG0
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_RegFile/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_RegFile} /SYS_TOP_TB/DUT/u_RegFile/o_REG1
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_RegFile/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_RegFile} /SYS_TOP_TB/DUT/u_RegFile/o_REG2
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_RegFile/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_RegFile} /SYS_TOP_TB/DUT/u_RegFile/o_REG3
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_RegFile/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_RegFile} /SYS_TOP_TB/DUT/u_RegFile/o_RdData_valid
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Reset_sync_SYS/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Reset_sync_SYS} /SYS_TOP_TB/DUT/u_Reset_sync_SYS/i_clk
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Reset_sync_SYS/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Reset_sync_SYS} /SYS_TOP_TB/DUT/u_Reset_sync_SYS/i_rst
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Reset_sync_SYS/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Reset_sync_SYS} /SYS_TOP_TB/DUT/u_Reset_sync_SYS/o_rst_sync
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Reset_sync_SYS/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Reset_sync_SYS} /SYS_TOP_TB/DUT/u_Reset_sync_SYS/rst_reg
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Reset_sync_UART/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Reset_sync_UART} /SYS_TOP_TB/DUT/u_Reset_sync_UART/i_clk
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Reset_sync_UART/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Reset_sync_UART} /SYS_TOP_TB/DUT/u_Reset_sync_UART/i_rst
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Reset_sync_UART/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Reset_sync_UART} /SYS_TOP_TB/DUT/u_Reset_sync_UART/o_rst_sync
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_Reset_sync_UART/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_Reset_sync_UART} /SYS_TOP_TB/DUT/u_Reset_sync_UART/rst_reg
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/i_clk
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/i_reset
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/i_ALU_OUT
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/i_OUT_VALID
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/i_full_FIFO
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/i_RdData_Valid
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/i_RX_P_DATA
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/i_RX_D_VLD
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/i_RdData
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/o_ALU_FUN
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/o_Enable
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/o_Clk_Enable
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/o_Address
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/o_RdEn
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/o_WrEn
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/o_WrData
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/o_TX_P_DATA
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/o_TX_D_VLD
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/o_clk_div_en
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/current_state
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/next_state
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_SYS_CTRL/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_SYS_CTRL} /SYS_TOP_TB/DUT/u_SYS_CTRL/Address
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/i_clk
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/i_reset
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/i_rx_in
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/i_Prescale
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/i_PAR_EN
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/i_PAR_TYP
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/o_data_valid
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/o_par_err
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/o_P_DATA
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/strt_check_en
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/par_check_en
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/stp_check_en
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/enable_cnt
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/deser_en
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/data_samp_en
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/bit_cnt
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/edge_cnt
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/sample_bit
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/strt_glitch
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/stp_err
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_RX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_RX} /SYS_TOP_TB/DUT/u_UART_RX/i_stp_chk_en
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_TX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_TX} /SYS_TOP_TB/DUT/u_UART_TX/i_clk
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_TX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_TX} /SYS_TOP_TB/DUT/u_UART_TX/i_rst_n
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_TX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_TX} /SYS_TOP_TB/DUT/u_UART_TX/i_P_DATA
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_TX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_TX} /SYS_TOP_TB/DUT/u_UART_TX/i_Data_Valid
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_TX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_TX} /SYS_TOP_TB/DUT/u_UART_TX/i_PAR_TYP
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_TX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_TX} /SYS_TOP_TB/DUT/u_UART_TX/i_PAR_EN
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_TX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_TX} /SYS_TOP_TB/DUT/u_UART_TX/o_TX_Out
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_TX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_TX} /SYS_TOP_TB/DUT/u_UART_TX/o_busy
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_TX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_TX} /SYS_TOP_TB/DUT/u_UART_TX/o_mux_sel
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_TX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_TX} /SYS_TOP_TB/DUT/u_UART_TX/o_ser_en
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_TX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_TX} /SYS_TOP_TB/DUT/u_UART_TX/o_ser_data
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_TX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_TX} /SYS_TOP_TB/DUT/u_UART_TX/o_ser_done
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_TX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_TX} /SYS_TOP_TB/DUT/u_UART_TX/o_par_bit
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/u_UART_TX/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/u_UART_TX} /SYS_TOP_TB/DUT/u_UART_TX/o_TX_Out_2
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/UART_RX_clk_div/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/UART_RX_clk_div} /SYS_TOP_TB/DUT/UART_RX_clk_div/i_clk
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/UART_RX_clk_div/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/UART_RX_clk_div} /SYS_TOP_TB/DUT/UART_RX_clk_div/i_Enable
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/UART_RX_clk_div/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/UART_RX_clk_div} /SYS_TOP_TB/DUT/UART_RX_clk_div/i_reset
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/UART_RX_clk_div/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/UART_RX_clk_div} /SYS_TOP_TB/DUT/UART_RX_clk_div/i_div_ratio
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/UART_RX_clk_div/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/UART_RX_clk_div} /SYS_TOP_TB/DUT/UART_RX_clk_div/o_clk_div
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/UART_RX_clk_div/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/UART_RX_clk_div} /SYS_TOP_TB/DUT/UART_RX_clk_div/counter
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/UART_RX_clk_div/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/UART_RX_clk_div} /SYS_TOP_TB/DUT/UART_RX_clk_div/clk_div
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/UART_TX_clk_div/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/UART_TX_clk_div} /SYS_TOP_TB/DUT/UART_TX_clk_div/i_clk
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/UART_TX_clk_div/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/UART_TX_clk_div} /SYS_TOP_TB/DUT/UART_TX_clk_div/i_Enable
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/UART_TX_clk_div/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/UART_TX_clk_div} /SYS_TOP_TB/DUT/UART_TX_clk_div/i_reset
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/UART_TX_clk_div/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/UART_TX_clk_div} /SYS_TOP_TB/DUT/UART_TX_clk_div/i_div_ratio
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/UART_TX_clk_div/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/UART_TX_clk_div} /SYS_TOP_TB/DUT/UART_TX_clk_div/o_clk_div
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/UART_TX_clk_div/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/UART_TX_clk_div} /SYS_TOP_TB/DUT/UART_TX_clk_div/counter
add wave -noupdate -label sim:/SYS_TOP_TB/DUT/UART_TX_clk_div/Group1 -group {Region: sim:/SYS_TOP_TB/DUT/UART_TX_clk_div} /SYS_TOP_TB/DUT/UART_TX_clk_div/clk_div
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {73141816 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {555518821 ps}

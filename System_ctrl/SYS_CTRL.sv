import Pkg_sys_ctrl::*;
import myPkg::*;
module SYS_CTRL #(parameter ALU_OUT_WIDTH = 16, ADDRESS_BTIS = 4)(
    input           logic                                       i_clk,
    input           logic                                       i_reset,
    input           logic            [ALU_OUT_WIDTH-1:0]        i_ALU_OUT,
    input           logic                                       i_OUT_VALID,
    input           logic                                       i_full_FIFO,
    input           logic                                       i_RdData_Valid,
    input           logic            [7:0]                      i_RX_P_DATA,
    input           logic                                       i_RX_D_VLD,
    input           logic            [7:0]                      i_RdData,
    output          ALU_FUN_t                                   o_ALU_FUN,
    output          logic                                       o_Enable,
    output          logic                                       o_Clk_Enable,
    output          logic            [3:0]                      o_Address,
    output          logic                                       o_RdEn,
    output          logic                                       o_WrEn,
    output          logic            [7:0]                      o_WrData,
    output          logic            [7:0]                      o_TX_P_DATA,
    output          logic                                       o_TX_D_VLD,
    output          logic                                       o_clk_div_en
);


Controller_state_t        current_state, next_state;

logic   [ADDRESS_BTIS-1:0]      Address;


always_ff @(posedge i_clk, negedge i_reset) begin
    if (!i_reset) begin
        current_state <= IDLE;
    end
    else begin
        current_state <= next_state;
    end
end

always_ff @(posedge i_clk, negedge i_reset) begin
    if (!i_reset) begin
        Address <= 0;
    end
    else if(current_state == RF_Wr_Addr && i_RX_D_VLD)begin
        Address <= i_RX_P_DATA;
    end
end



always_comb begin
    case (current_state)
        IDLE: begin
            if (i_RX_D_VLD) begin
                case (i_RX_P_DATA)
                    8'hAA: begin
                        next_state = RF_Wr_Addr;
                    end
                    8'hBB: begin
                        next_state = RF_Rd_Addr;
                    end 
                    8'hCC: begin
                        next_state = Operand_A;
                    end
                    8'hDD: begin
                        next_state = ALU_FUN;
                    end
                    default: begin
                        next_state = IDLE;
                    end
                endcase
            end
        end
        RF_Wr_Addr: begin
            if (i_RX_D_VLD) begin
                next_state = RF_Wr_Data;                
            end
            else begin
                next_state = RF_Wr_Addr;                
            end
        end
        RF_Wr_Data: begin
            if (i_RX_D_VLD) begin
                next_state = IDLE;                
            end
            else begin
                next_state = RF_Wr_Data;                
            end
        end
        RF_Rd_Addr: begin
            if (i_RX_D_VLD) begin
                next_state = READ_RegFile_result;                
            end
            else begin
                next_state = RF_Rd_Addr;                
            end
        end
        Operand_A: begin
            if (i_RX_D_VLD) begin
                next_state = Operand_B;                
            end
            else begin
                next_state = Operand_A;                
            end
        end
        Operand_B: begin
            if (i_RX_D_VLD) begin
                next_state = ALU_FUN;                
            end
            else begin
                next_state = Operand_B;                
            end
        end
        ALU_FUN: begin
            if (i_RX_D_VLD) begin
                next_state = ALU_Result_byte0;                
            end
            else begin
                next_state = ALU_FUN;                
            end
        end
        ALU_Result_byte0: begin
            if (i_OUT_VALID) begin
                next_state = ALU_Result_byte1;                
            end
            else begin
                next_state = ALU_Result_byte0;                
            end
        end
        ALU_Result_byte1: begin
            next_state = IDLE;                
        end
        READ_RegFile_result: begin
            if (i_RdData_Valid) begin
                next_state = IDLE;                
            end
            else begin
                next_state = READ_RegFile_result;                
            end
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end


always_comb begin
    o_Enable = 0;
    o_Clk_Enable = 1;
    o_RdEn = 0;
    o_WrEn = 0;
    o_TX_P_DATA = 0;
    o_TX_D_VLD = 0;
    o_clk_div_en = 1;
    o_Address = 0;
    o_WrData = 0;
    case (current_state)
        RF_Wr_Data: begin
            if (i_RX_D_VLD) begin
                o_Address = Address;
                o_WrData = i_RX_P_DATA;
                o_WrEn = 1;
            end
            else begin
                o_Address = Address;
                o_WrData = i_RX_P_DATA;
                o_WrEn = 0;
            end
        end
        RF_Rd_Addr: begin
            o_Address = i_RX_P_DATA;
            o_RdEn = 1;
        end
        Operand_A: begin
            o_Address = 0;
            o_WrData = i_RX_P_DATA;
            o_WrEn = 1;
        end
        Operand_B: begin
            o_Address = 1;
            o_WrData = i_RX_P_DATA;
            o_WrEn = 1;
        end
        ALU_FUN: begin
            o_ALU_FUN = ALU_FUN_t'(i_RX_P_DATA);
            o_Enable = 1;
        end
        ALU_Result_byte0: begin
            if (i_OUT_VALID && !i_full_FIFO) begin
                o_TX_P_DATA = i_ALU_OUT[7:0];
                o_TX_D_VLD = 1;
            end
            else begin
                o_TX_P_DATA = 0;
                o_TX_D_VLD = 0;
            end
        end
        ALU_Result_byte1: begin
            o_TX_P_DATA = i_ALU_OUT[15:8];
            o_TX_D_VLD = 1;
        end
        READ_RegFile_result: begin
            if (i_RdData_Valid) begin
                o_TX_P_DATA = i_RdData;
                o_TX_D_VLD = 1;
            end
            else begin
                o_TX_P_DATA = 0;
                o_TX_D_VLD = 0;
            end
        end
    endcase  
end


endmodule
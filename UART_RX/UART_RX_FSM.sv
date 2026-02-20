module UART_RX_FSM (
    input       logic                       i_reset,
    input       logic                       i_clk,
    input       logic                       i_rx_in,
    input       logic                       i_PAR_EN,
    input       logic       [3:0]           i_bit_cnt,
    input       logic       [5:0]           i_Prescale,
    input       logic       [4:0]           i_edge_cnt,
    input       logic                       i_par_err,
    input       logic                       i_stp_err,
    input       logic                       i_strt_glitch,
    output      logic                       o_strt_check_en,
    output      logic                       o_par_check_en,
    output      logic                       o_stp_check_en,
    output      logic                       o_data_valid,
    output      logic                       o_enable_cnt,
    output      logic                       o_deser_en,
    output      logic                       o_data_samp_en                 
);

enum {IDLE, START, DATA_SAMPLE, PARITY, STOP} current_state, next_state;

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
        o_data_valid <= 0;
    end
    else if(current_state == STOP && i_edge_cnt == i_Prescale-1 && !i_stp_err) begin
        o_data_valid <= 1;
    end
    else begin
        o_data_valid <= 0;
    end
end


always_comb begin
    case (current_state)
        IDLE: begin
            if (!i_rx_in) begin
                next_state = START;
            end
            else begin
                next_state = IDLE;
            end
        end
        START: begin
            if (i_strt_glitch) begin
                next_state = IDLE;
            end
            else if (i_bit_cnt == 0 && i_edge_cnt == i_Prescale-1) begin
                next_state = DATA_SAMPLE;
            end
            else begin
                next_state = START;
            end
        end
        DATA_SAMPLE: begin
            if (i_bit_cnt == 8 && i_edge_cnt == i_Prescale-1) begin
                if (i_PAR_EN) begin
                    next_state = PARITY;
                end
                else begin
                    next_state = STOP;
                end
            end
            else begin
                next_state = DATA_SAMPLE;
            end
        end
        PARITY: begin
            if (i_bit_cnt == 9 && i_edge_cnt == i_Prescale-1) begin
                if (i_par_err) begin
                    next_state = IDLE; 
                end
                else begin
                    next_state = STOP;
                end
            end
            else begin
                next_state = PARITY;
            end
        end
        STOP: begin
            if (i_PAR_EN) begin
                if (i_bit_cnt == 10 && i_edge_cnt == i_Prescale-1) begin
                    next_state = IDLE;                
                end
                else begin
                    next_state = STOP;                
                end
            end
            else begin
                if (i_bit_cnt == 9 && i_edge_cnt == i_Prescale-1) begin
                    next_state = IDLE;                
                end
                else begin
                    next_state = STOP;                
                end
            end
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end    

always_comb begin
    o_strt_check_en = 0;
    o_par_check_en = 0;
    o_stp_check_en = 0;
    o_enable_cnt = 1;
    o_deser_en = 0;
    o_data_samp_en = 0;
    case (current_state)
        IDLE: begin
            if (!i_rx_in) begin
                o_data_samp_en = 1;
                o_enable_cnt = 1;
            end
            else begin
                o_data_samp_en = 0;
                o_enable_cnt = 0;
            end
        end
        START: begin
            o_data_samp_en = 1;
            if (i_edge_cnt == i_Prescale-1) begin
                o_strt_check_en = 1;
            end
        end
        DATA_SAMPLE: begin
            o_data_samp_en = 1;
            if (i_edge_cnt == i_Prescale-1) begin
                o_deser_en = 1;
            end
        end
        PARITY: begin
            o_data_samp_en = 1;
            if (i_edge_cnt == i_Prescale-1) begin
                o_par_check_en = 1;
            end
        end
        STOP: begin
            o_data_samp_en = 1;
            if (i_edge_cnt == i_Prescale-1) begin
                o_stp_check_en = 1;
            end
        end
    endcase
end

endmodule
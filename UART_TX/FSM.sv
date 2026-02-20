module FSM (
    input       logic                 i_clk,
    input       logic                 i_rst_n,
    input       logic                 i_DATA_Valid,
    input       logic                 i_ser_done,
    input       logic                 i_PAR_EN,
    output      logic        [1:0]    o_mux_sel,
    output      logic                 o_ser_en,
    output      logic                 o_busy
);


enum {IDLE, START, SERIAL, PARTY, STOP} current_state, next_state;


logic               busy_comb;
logic   [1:0]       mux_sel_comb;


always_ff @(posedge i_clk, negedge i_rst_n) begin
    if (!i_rst_n) begin
        current_state <= IDLE;
    end
    else begin
        current_state <= next_state;
    end
end

// always_ff @(posedge i_clk, negedge i_rst_n) begin
//     if (!i_rst_n) begin
//         // o_busy <= 0;
//         o_mux_sel <= 0;
//     end
//     else begin
//         // o_busy <= busy_comb;
//         o_mux_sel <= mux_sel_comb;
//     end
// end

always_comb begin
    case (current_state)
        IDLE: begin
            if (i_DATA_Valid) begin
                next_state = START;
            end
            else begin
                next_state = IDLE;
            end
        end
        START: begin
            next_state = SERIAL;
        end
        SERIAL: begin
            if (i_ser_done) begin
                if (i_PAR_EN) begin
                    next_state = PARTY;
                end
                else begin
                    next_state = STOP;
                end
            end
            else begin
                next_state = SERIAL;
            end
        end
        PARTY: begin
            next_state = STOP;
        end
        STOP: begin
            next_state = IDLE;
        end
        default: begin
            next_state = IDLE;
        end
   endcase     
end

always_comb begin
    o_ser_en = 0;
   case (current_state)
        IDLE: begin
            o_busy = 0;
            o_mux_sel = 3;
        end
        START: begin
            o_busy = 1;
            o_mux_sel = 0;
        end
        SERIAL: begin
            o_busy = 1;
            o_ser_en = 1;
            o_mux_sel = 1;
        end
        PARTY: begin
            o_busy = 1;
            o_mux_sel = 2;
        end
        STOP: begin
            o_busy = 1;   
            o_mux_sel = 3;
        end
        default: begin
            o_busy = 0;
            o_mux_sel = 0;
        end
   endcase 
end

    
endmodule
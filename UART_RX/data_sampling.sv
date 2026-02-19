module data_sampling(
    input       logic                       i_clk,
    input       logic                       i_reset,
    input       logic                       i_rx_in,
    input       logic                       i_data_samp_en,
    input       logic       [5:0]           i_Prescale,
    input       logic       [4:0]           i_edge_cnt,
    output      logic                       o_sample_bit
);


logic       [4:0]           sampled_stored;
logic sample_bit_comb;

always_ff @(posedge i_clk, negedge i_reset) begin
    if (!i_reset) begin
        sampled_stored <= 0;
    end
    else if (i_data_samp_en) begin
        if (i_Prescale == 8) begin
            case (i_edge_cnt)
                5'b0010: begin
                    sampled_stored[0] <= i_rx_in;
                end
                5'b0011: begin
                    sampled_stored[1] <= i_rx_in;
                end
                5'b0100: begin
                    sampled_stored[2] <= i_rx_in;
                end
            endcase
        end
        else if (i_Prescale == 16) begin
            case (i_edge_cnt)
                5'b00110: begin
                    sampled_stored[0] <= i_rx_in;
                end
                5'b00111: begin
                    sampled_stored[1] <= i_rx_in;
                end
                5'b01000: begin
                    sampled_stored[2] <= i_rx_in;
                end
            endcase
        end
        else if (i_Prescale == 32) begin
            case (i_edge_cnt)
                5'b01110: begin
                    sampled_stored[0] <= i_rx_in;
                end
                5'b01111: begin
                    sampled_stored[1] <= i_rx_in;
                end
                5'b10000: begin
                    sampled_stored[2] <= i_rx_in;
                end
            endcase
        end
        
    end
end


always_ff @(posedge i_clk, negedge i_reset) begin
    if (!i_reset) begin
        o_sample_bit <= 0;
    end
    else if(i_data_samp_en && i_edge_cnt == i_Prescale-2)begin
        o_sample_bit <= sample_bit_comb;
    end
end


always_comb begin
    sample_bit_comb = 0;
    case (sampled_stored)
        5'bxx000:
        begin
            sample_bit_comb = 0;
        end
        5'bxx001:
        begin
            sample_bit_comb = 0;
        end
        5'b00010:
        begin
            sample_bit_comb = 0;
        end
        5'b00011:
        begin
            sample_bit_comb = 1;
        end
        5'b00100:
        begin
            sample_bit_comb = 0;
        end
        5'b00101:
        begin
            sample_bit_comb = 1;
        end
        5'b00110:
        begin
            sample_bit_comb = 1;
        end
        5'b00111:
        begin
            sample_bit_comb = 1;
        end
    endcase 
end

endmodule
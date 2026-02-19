module edge_bit_cnt(
    input           logic                           i_clk,
    input           logic                           i_reset,
    input           logic                           i_enable,
    input           logic                           i_PAR_EN,
    input           logic           [5:0]           i_Prescale,
    output          logic           [3:0]           o_bit_cnt,
    output          logic           [4:0]           o_edge_cnt
);

logic           [3:0]           bit_cnt_comb;


always_ff @(posedge i_clk, negedge i_reset) begin
    if (!i_reset) begin
        o_bit_cnt <= 0;
    end
    else if (i_enable) begin
        o_bit_cnt <= bit_cnt_comb;
    end
end

always_ff @(posedge i_clk, negedge i_reset) begin
    if (!i_reset) begin
        o_edge_cnt <= 0;
    end
    else if (i_enable) begin
        if (o_edge_cnt == i_Prescale-1) begin
            o_edge_cnt <= 0;
        end
        else begin
            o_edge_cnt <= o_edge_cnt + 1;
        end
    end
end
    

always_comb begin
    bit_cnt_comb = o_bit_cnt;

    if (o_edge_cnt == i_Prescale - 1) begin
        if (i_PAR_EN) begin
            if (o_bit_cnt == 10) 
                bit_cnt_comb = 0;
            else 
                bit_cnt_comb = o_bit_cnt + 1;
        end
        else begin
            if (o_bit_cnt == 9) 
                bit_cnt_comb = 0;
            else 
                bit_cnt_comb = o_bit_cnt + 1;
        end
    end
end


endmodule 

module FIFO_full #(parameter DEPTH = 8) (
    input        logic                                  i_wclk,
    input        logic                                  i_reset_n,
    input        logic                                  i_wr_en,
    input        logic       [$clog2(DEPTH):0]          i_rptr,
    output       logic       [$clog2(DEPTH):0]          o_waddr,
    output       logic       [$clog2(DEPTH):0]          o_wptr,
    output       logic                                  o_full,   
    output       logic                                  o_OF
);


// logic    [$clog2(DEPTH):0]     waddrPLUS1 = o_waddr + 1;

assign o_wptr = (o_waddr>>1) ^ o_waddr;

assign o_full = (o_wptr[$clog2(DEPTH) -: 2] == ~i_rptr[$clog2(DEPTH) -: 2]) && (o_wptr[0 +: $clog2(DEPTH)-1] == i_rptr[0 +: $clog2(DEPTH)-1]);


always_ff @(posedge i_wclk, negedge i_reset_n) begin
    if (!i_reset_n) begin
        o_waddr <= 0;
    end
    else if(i_wr_en && !o_full)begin
        o_waddr <= o_waddr + 1;
    end
end


always_ff @(posedge i_wclk, negedge i_reset_n) begin : OF_FLAG
    if(!i_reset_n) begin
        o_OF <= 0;
    end
    else if(i_wr_en && o_full) begin
        o_OF <= 1;
    end
    else begin
        o_OF <= 0;
    end
end


endmodule //moduleName

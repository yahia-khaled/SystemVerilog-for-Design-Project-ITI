module Asynchronous_FIFO #(parameter WIDTH = 8, DEPTH = 16)(
    input     logic                          i_wclk,
    input     logic                          i_rclk,
    input     logic                          i_reset_n,
    input     logic                          i_wr_en,
    input     logic      [WIDTH-1:0]         i_Data,
    input     logic                          i_rd_en,
    output    logic      [WIDTH-1:0]         o_Data,
    output    logic                          o_full,
    output    logic                          o_empty,
    output    logic                          o_OF,
    output    logic                          o_UV
);

// output declaration of module FIFO_full
logic [$clog2(DEPTH):0] o_waddr;
logic [$clog2(DEPTH):0] o_wptr;
logic [$clog2(DEPTH):0] o_wptr_sync;
// output declaration of module FIFO_empty
logic [$clog2(DEPTH):0] o_raddr;
logic [$clog2(DEPTH):0] o_rptr;
logic [$clog2(DEPTH):0] o_rptr_sync;


FIFO_full #(.DEPTH 	(DEPTH  )) u_FIFO_full(
    .i_wclk    	(i_wclk     ),
    .i_reset_n 	(i_reset_n  ),
    .i_wr_en   	(i_wr_en    ),
    .i_rptr    	(o_rptr_sync     ),
    .o_waddr   	(o_waddr    ),
    .o_wptr    	(o_wptr     ),
    .o_OF    	(o_OF     ),
    .o_full    	(o_full     )
);



FIFO_empty #(
    .DEPTH 	(DEPTH  ))
u_FIFO_empty(
    .i_rclk    	(i_rclk     ),
    .i_reset_n 	(i_reset_n  ),
    .i_rd_en   	(i_rd_en    ),
    .i_wptr    	(o_wptr_sync     ),
    .o_raddr   	(o_raddr    ),
    .o_UV    	(o_UV     ),
    .o_rptr    	(o_rptr     ),
    .o_empty   	(o_empty    )
);


DF_Sync #(.WIDTH ($clog2(DEPTH)+1  )) u_DF_Sync_wraddr (
    .i_clk     	(i_rclk      ),
    .i_reset_n 	(i_reset_n  ),
    .i_async   	(o_wptr    ),
    .o_sync    	(o_wptr_sync     )
);


DF_Sync #(.WIDTH ($clog2(DEPTH)+1  )) u_DF_Sync_rdaddr (
    .i_clk     	(i_wclk      ),
    .i_reset_n 	(i_reset_n  ),
    .i_async   	(o_rptr    ),
    .o_sync    	(o_rptr_sync     )
);



FIFO_MEM #(.WIDTH (WIDTH ),.DEPTH 	(DEPTH  )) u_FIFO_MEM(
    .i_wclk    	(i_wclk     ),
    .i_rclk    	(i_rclk     ),
    .i_reset_n 	(i_reset_n  ),
    .i_wr_en   	(i_wr_en    ),
    .i_full 	(o_full  ),
    .i_empty 	(o_empty  ),
    .i_rd_en   	(i_rd_en    ),
    .i_wrddr   	(o_waddr[0 +: $clog2(DEPTH)]),
    .i_rdaddr  	(o_raddr[0 +: $clog2(DEPTH)]),
    .i_DATA    	(i_Data     ),
    .o_DATA    	(o_Data     )
);




endmodule
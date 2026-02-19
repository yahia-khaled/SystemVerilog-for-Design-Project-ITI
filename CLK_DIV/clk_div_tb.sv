module clk_div_tb ();
    

// output declaration of module clk_div
logic           i_clk;
logic           i_Enable;
logic           i_reset;
logic [3:0]     i_div_ratio;
logic           o_clk_div;


clk_div #(
    .DIV_VAL_WIDTH 	(4  ))
u_clk_div(
    .i_clk       	(i_clk        ),
    .i_Enable    	(i_Enable     ),
    .i_reset     	(i_reset      ),
    .i_div_ratio 	(i_div_ratio  ),
    .o_clk_div   	(o_clk_div    )
);


initial begin
    i_reset = 1;
    #2;
    i_reset = 0;
    #2;
    i_reset = 1;

    i_Enable = 1;
    i_div_ratio = 3;

    #200;
    $stop;

end

initial begin
    i_clk = 0;
    forever begin
        #1 i_clk = ~i_clk;
    end
end


endmodule
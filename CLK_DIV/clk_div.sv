module clk_div #(parameter DIV_VAL_WIDTH = 4)(
    input       logic                                   i_clk,
    input       logic                                   i_Enable,
    input       logic                                   i_reset,
    input       logic        [DIV_VAL_WIDTH-1:0]        i_div_ratio,
    output      logic                                   o_clk_div
);


logic       [DIV_VAL_WIDTH-1:0]         counter;



logic                                   clk_div;

always_ff @(posedge i_clk, negedge i_reset) begin
    if (!i_reset) begin
        clk_div <= 0;
    end
    else begin
        if (counter == (i_div_ratio/2) - 1) begin
            clk_div <= 1;
        end
        else if (counter == (i_div_ratio) - 1) begin
            clk_div <= 0; 
        end
    end
end

always_ff @(posedge i_clk, negedge i_reset) begin
    if (!i_reset) begin
        counter <= 0;
    end
    else if (i_Enable) begin
        if (counter == i_div_ratio-1) begin
            counter <= 0;
        end
        else begin
            counter <= counter + 1; 
        end
    end
end


assign o_clk_div = (i_Enable && i_div_ratio != 1    )? clk_div : i_clk;
    
endmodule //moduleName

module serializer(
    input       logic                           i_clk,
    input       logic                           i_rst_n,
    input       logic       [7:0]               i_P_DATA,
    input       logic                           i_ser_en,
    output      logic                           o_ser_data,
    output      logic                           o_ser_done
);

logic       [2:0]          counter;


// always_ff @(posedge i_clk, negedge i_rst_n) begin
//     if (!i_rst_n) begin
//         o_ser_data <= 0;
//     end
//     else begin
//         o_ser_data <= i_P_DATA[counter];
//     end
// end

assign o_ser_data = i_P_DATA[counter];


always_ff @(posedge i_clk, negedge i_rst_n) begin
    if (!i_rst_n) begin
        counter <= 0;
    end
    else if(i_ser_en)begin
        counter <= counter + 1;
    end
end

always_ff @(posedge i_clk, negedge i_rst_n) begin
    if (!i_rst_n) begin
        o_ser_done <= 0;
    end
    else if(counter == 6)begin
        o_ser_done <= 1;
    end
    else begin
        o_ser_done <= 0;
    end
end


endmodule
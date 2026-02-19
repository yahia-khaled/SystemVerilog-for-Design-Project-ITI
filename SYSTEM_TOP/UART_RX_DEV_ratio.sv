module UART_RX_DEV_ratio #(parameter DIV_RATIO_WIDTH = 8)(
    input       logic     [5:0]                             i_prescale,
    output      logic     [DIV_RATIO_WIDTH-1:0]             o_UART_RX_dev_ratio
);


always_comb begin
    case (i_prescale)
        6'd32: begin
            o_UART_RX_dev_ratio = 1;
        end
        6'd16: begin
            o_UART_RX_dev_ratio = 2;
        end
        6'd8: begin
            o_UART_RX_dev_ratio = 4;
        end
        default: begin
            o_UART_RX_dev_ratio = 1;
        end
    endcase
end
endmodule
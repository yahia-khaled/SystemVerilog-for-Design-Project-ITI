module RegFile #(parameter ADDRESS_BTIS = 4, DATA_WIDTH = 8)(
    input       logic                               i_clk,
    input       logic                               i_reset,
    input       logic       [ADDRESS_BTIS-1:0]      i_Address,
    input       logic                               i_WrEn,
    input       logic                               i_RdEn,
    input       logic       [DATA_WIDTH-1:0]        i_WrData,
    output      logic       [DATA_WIDTH-1:0]        o_RdData,
    output      logic       [DATA_WIDTH-1:0]        o_REG0,
    output      logic       [DATA_WIDTH-1:0]        o_REG1,
    output      logic       [DATA_WIDTH-1:0]        o_REG2,
    output      logic       [DATA_WIDTH-1:0]        o_REG3,
    output      logic                               o_RdData_valid
);




logic           [DATA_WIDTH-1:0]            REG_FILE            [0:(ADDRESS_BTIS)**2-1];



always_ff @(posedge i_clk, negedge i_reset) begin
    if (!i_reset) begin
        o_RdData <= 0;
        for (int i = 0;i < (ADDRESS_BTIS)**2; i++) begin
           REG_FILE[i] <= 0;
        end
        // REG 2 default value
        REG_FILE[2][0] <= 1'b1;
        REG_FILE[2][1] <= 1'b0;
        REG_FILE[2][7:2] <= 6'd32;
        // REG 3 default value
        REG_FILE[3] <= 8'd32;
    end
    else if(i_WrEn)begin
        REG_FILE[i_Address] <= i_WrData;
    end
    else if (i_RdEn) begin
        o_RdData <= REG_FILE[i_Address];
    end
end

always_ff @(posedge i_clk, negedge i_reset) begin
    if (!i_reset) begin
        o_RdData_valid <= 0;
    end
    else if (i_RdEn) begin
        o_RdData_valid <= 1;
    end
    else begin
        o_RdData_valid <= 0;
    end
end


assign o_REG0 = REG_FILE[0];
assign o_REG1 = REG_FILE[1];
assign o_REG2 = REG_FILE[2];
assign o_REG3 = REG_FILE[3];
    
endmodule
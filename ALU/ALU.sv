import myPkg::*;
module ALU #(parameter DATA_WIDTH = 8,  OUT_WIDTH = 2*DATA_WIDTH)(
    input       logic                                   i_clk,
    input       logic                                   i_reset,
    input       logic                                   i_Enable,
    input       ALU_FUN_t                               i_ALU_FUN,
    input       logic           [DATA_WIDTH-1:0]        i_A,
    input       logic           [DATA_WIDTH-1:0]        i_B,
    output      logic                                   o_OUT_VALID,
    output      logic           [OUT_WIDTH-1:0]         o_ALU_OUT
);


logic       [OUT_WIDTH-1:0]         ALU_OUT_comb;

    
always_ff @(posedge i_clk, negedge i_reset) begin
    if (!i_reset) begin
        o_ALU_OUT <= 0;
        o_OUT_VALID <= 0;
    end
    else if (i_Enable)begin
        o_ALU_OUT <= ALU_OUT_comb;
        o_OUT_VALID <= 1;
    end
    else begin
        o_OUT_VALID <= 0;
    end
end



always_comb begin
    ALU_OUT_comb = 0;
    case (i_ALU_FUN)
        ADD: begin
            ALU_OUT_comb = i_A + i_B;
        end
        SUB: begin
            ALU_OUT_comb = i_A - i_B;
        end
        MUL: begin
            ALU_OUT_comb = i_A * i_B;
        end
        DIV: begin
            if (i_B == 0) begin
                ALU_OUT_comb = 0;
            end
            else begin
                ALU_OUT_comb = i_A / i_B;
            end
        end
        AND: begin
            ALU_OUT_comb = i_A & i_B;
        end
        OR: begin
            ALU_OUT_comb = i_A | i_B;
        end
        NAND: begin
            ALU_OUT_comb = ~(i_A & i_B);
        end
        NOR: begin
            ALU_OUT_comb = ~(i_A | i_B);
        end
        XOR: begin
            ALU_OUT_comb = i_A ^ i_B;
        end
        XNOR: begin
            ALU_OUT_comb = ~(i_A ^ i_B);
        end
        EQU: begin
            ALU_OUT_comb = i_A == i_B;
        end
        GT: begin
            ALU_OUT_comb = i_A > i_B;
        end
        SHIFT_RIGHT: begin
            ALU_OUT_comb = i_A >> 1;
        end
        SHIFT_LEFT: begin
            ALU_OUT_comb = i_A << 1;
        end
    endcase
end

    
endmodule //ALU

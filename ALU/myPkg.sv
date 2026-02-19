package myPkg;
    parameter ALU_FUN_WDITH = 4;
    parameter DATA_WIDTH = 8;
    parameter OUT_WIDTH = 2*DATA_WIDTH;
    typedef enum logic [ALU_FUN_WDITH-1:0] {ADD, SUB, MUL, DIV, AND, OR, NAND, NOR, XOR, XNOR, EQU, GT, SHIFT_RIGHT, SHIFT_LEFT} ALU_FUN_t;
endpackage
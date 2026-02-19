# SystemVerilog Modern Design Implementation

This project strictly adheres to modern SystemVerilog (IEEE 1800) design principles, moving beyond legacy Verilog-2001 to ensure safer synthesis, cleaner code, and robust verification.

---

## 1. The `logic` Data Type

Replaced legacy `wire` and `reg` types with the SystemVerilog `logic` data type across all modules. This prevents multiple-driver conflicts (as `logic` strictly allows only a single continuous assignment) and simplifies port declarations.

---

## 2. SystemVerilog Packages (`package`)

Utilized SystemVerilog packages (`Pkg_sys_ctrl.sv` and `myPkg.sv`) to encapsulate globally shared parameters, custom types, and opcodes. This eliminates the need for messy `` `include `` directives and prevents macro namespace pollution.

---

## 3. Strongly-Typed Enumerations (`enum`)

FSM states (such as those in `UART_RX_FSM.sv`, `FSM.sv` for TX, and `SYS_CTRL.sv`) are defined using strongly-typed `enum logic [N:0]` constructs. This provides:

- **Readability:** States are named logically (e.g., `IDLE`, `START`, `DATA`) instead of using raw binary parameters.  
- **Safety:** EDA tools can automatically verify that FSM state variables are not assigned illegal or out-of-bounds values.

---

## 4. Hardware-Specific Procedural Blocks

Replaced the generic `always @(*)` and `always @(posedge clk)` blocks with SystemVerilog's intent-specific blocks:

### `always_ff`

Used for all sequential logic (Registers, Counters, FIFO memory). This enforces design rules, ensuring that linting and synthesis tools flag unintended latches.

### `always_comb`

Used for combinational logic (ALU operations, next-state logic in FSMs). It guarantees auto-sensitivity to all read variables, preventing simulation/synthesis mismatches.

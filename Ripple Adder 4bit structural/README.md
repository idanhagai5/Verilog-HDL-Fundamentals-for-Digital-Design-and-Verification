# Project 4
Design and verify a 4 bit ripple carry adder which instantiate "full_adder_structural" module. 

## Interface Definition
The module should have the following interface:

```verilog
input   wire [7:0]    a_i   - First leg of the mux
input   wire [7:0]    b_i   - Second leg of the mux
input   wire          sel_i - Mux select
output  wire [7:0]    y_o   - Mux output
```

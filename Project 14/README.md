# Project 14
Design and verify a shift-left-right register.
This register can be loaded with an 8-bit value and can be shift left or right.

## Interface Definition
The module should have the following interface:

```verilog
  input              reset_n
  input              clk
  input [7:0]        i - 8 bit input
  input              load_enable - 1 for load and 0 for enable shifting
  input              shift_left_right - 0 for shift left and 1 for shift right
  output reg [7:0]   q - 8 bit output
```

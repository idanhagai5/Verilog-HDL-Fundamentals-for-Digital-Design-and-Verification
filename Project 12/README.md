# Project 12
Design and verify a PIPO shift register.

## Interface Definition
The module should have the following interface:

```verilog
  input              reset_n - Reset signal.
  input              clk - Clock signal. 
  input [3:0]        d - D input of register.
  output reg [3:0]   q - Q output of register.
```

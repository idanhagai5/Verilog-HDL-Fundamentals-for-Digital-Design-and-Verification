# Project15
Design and verify a 4-bit linear feedback shift register where the bit[0] of the register
is driven by the XOR of the LFSR register bit[1] and bit[3].

## Interface Definition
The module should have the following interface:

```verilog
input                reset_n
input                clk
input                enable - if 1, enable shifting.

output reg [3:0]    lfsr 
```

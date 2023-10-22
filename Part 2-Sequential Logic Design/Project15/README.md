# Project15
Design and verify a 16-bit linear feedback shift register where the bit[0] of the register
is driven by the XOR of the LFSR register bit[10], bit[12], bit[13] and bit[15]

## Interface Definition
The module should have the following interface:

```verilog
input                reset_n
input                clk
input                enable - if 1, enable shifting.

output reg [15:0]    lfsr 
```

# Project19
Design and verify a FSM of a trafic lights circut.

## Interface Definition
| Current State | Input | Next State |Output |
|----------|-----------|---------|---------|
|OFF|enable =1|RED|ALL LIGHTS OFF|
| |ENABLE = 0|OFF|ALL LIGHTS OFF|
|3'b0011|SUB|Subtruct b from a|
|3'b0100|INC|Increment A|
|3'b0101|DEC|Decrement A|
|3'b0110|AND|Bitwise AND|
|3'b0111|NOT|NOT A|
|3'b1000|ROL|Rotate left A|
|3'b1001|ROR|Rotate right A|
```verilog
    input              clk,
    input [3:0]        address,
    output reg [7:0]   data_out
```

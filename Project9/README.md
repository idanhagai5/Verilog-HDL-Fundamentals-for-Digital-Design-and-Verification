# Project 9
Design and verify a 8-bit ALU which supports the following encoded operations:
| Encoding | Operation | Comment |
|----------|-----------|---------|
|3'b0001|ADD|Addition of a and b|
|3'b0010|ADD_CARRY|Addition of a,b and carry in|
|3'b0011|SUB|Subtruct b from a|
|3'b0100|INC|Increment A|
|3'b0101|DEC|Decrement A|
|3'b0110|AND|Bitwise AND|
|3'b0111|NOT|NOT A|
|3'b1000|ROL|Rotate left A|
|3'b1001|ROR|Rotate right A|

## Interface Definition
The module should have the following interface:

```verilog
input         [BUS_WIDTH-1:0] a - First input of ALU.
input         [BUS_WIDTH-1:0] b - Second input of ALU.
input         carry_in - carry input to ALU.

input         [3:0] opcode - Encoded Operation. 
output reg    [BUS_WIDTH-1:0] y - ALU output.
output reg    carry_out - Overflow bit in addition.
output reg    borrow - Underflow bit in substruction.
output        zero - Output is zero.
output        parity - Output is even.
output reg    invalid_op - Invalid opcode
```

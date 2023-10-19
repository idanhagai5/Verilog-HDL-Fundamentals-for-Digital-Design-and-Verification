# Project 12
Design and verify a PIPO shift register.

## Interface Definition
The module should have the following interface:

```verilog
input     wire    clk,
input     wire    reset,

input     wire    a_i,            -> Serial input to the module

output    wire    rising_edge_o,  -> Rising edge output
output    wire    falling_edge_o  -> Falling edge output
```

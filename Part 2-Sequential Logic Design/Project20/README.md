# Project19
Design and verify a NON overlaping sequence detector.
The circut is going to detect a sequence of "101".

## Interface Definition


```verilog
  input               clk,
  input               rst_n,
  input               seq_in,

  output reg          detected, - Indicates that a sequance has been detected.
  output              state_out - Current state of the FSM.
```

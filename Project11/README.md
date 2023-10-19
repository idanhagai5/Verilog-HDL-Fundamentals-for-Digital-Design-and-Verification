# Project11
Design and verify a D flip-flop with a synchronous reset.

## Interface Definition
The module should have the following interface:

```verilog
  input      d - D input of FF.
  input      clk - clock signal.
  input      reset_n - when 0, reset the value of Q.

  output reg q -  Q output of FF.
  output q_not - ~Q output of FF.
```

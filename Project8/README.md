# Project8
Design and verify a 4to16 decoder using 2 3to8 decoders with enable signal.

## Interface Definition
The module should have the following interface:

```verilog
  input [3:0] a
  output [15:0] d
```

The sub-module should have the following interface:

```verilog
  input [2:0] a
  input enable
  output reg [7:0] y
```

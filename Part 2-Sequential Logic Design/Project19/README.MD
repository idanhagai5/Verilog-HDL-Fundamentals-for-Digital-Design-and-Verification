# Project19
Design and verify a FSM of a trafic lights circut.

## Interface Definition
| Current State | Input | Next State |Output |
|----------|-----------|---------|---------|
|OFF|Enable =1|RED|All lights off|
| |Enable = 0|OFF|All lights off|
|RED|Timer = 50|YELLOW|Red = ON|
||Timer < 50|RED|Red = ON|
|YELLOW|Timer = 10|GREEN|Yellow = ON|
||Timer < 10|YELLOW|Yellow = ON|
|GREEN|Timer = 30|RED|Green = ON|
||Timer < 30|GREEN|Green = ON|
```verilog
    input              clk,
    input [3:0]        address,
    output reg [7:0]   data_out
```

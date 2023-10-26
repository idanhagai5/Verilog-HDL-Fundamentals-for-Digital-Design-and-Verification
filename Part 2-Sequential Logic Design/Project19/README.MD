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
  input               clk,
  input               reset_n,
  input               enable,
  output reg          red, - red light is active
  output reg          yellow, - yellow light is active
  output reg          green, - green light is active
  output [3:0]        state_out - indicates the current state 
```

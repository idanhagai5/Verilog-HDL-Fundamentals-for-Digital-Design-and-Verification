# Project16
Design and verify a N-bit counter which supports loading a value, and counting up and down. 

## Interface Definition
- Counter should reset to 0
- The module should have the following interface:

```verilog
input                    clk,
input                    reset_n,
input                    load, - Load value is valid this cycle.
input [CNT_WIDTH -1:0]   counter_in, - N-bit load value.
input                    up_down, - 1-count up, 0-count down.

output [CNT_WIDTH -1:0]  count_out - Counter output.
```

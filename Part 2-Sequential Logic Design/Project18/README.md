# Project18
Design and verify a synchronous read only memory (ROM).

## Interface Definition
- The ROM contains 16x 8bit words, and can be modified with parameters.
- At each clock, the address information will be processed and data from that location will be shown at the output. 
- The ROM will be loaded with the data from the file rom_init.hex.

```verilog
    input              clk,
    input [3:0]        address,
    output reg [7:0]   data_out
```

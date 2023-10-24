# Day 5
Design and verify a single-port asyncronous read SRAM.

## Interface Definition
- The SRAM will have 16x 8bit words.
- Data will be written to the SRAM on the positive edge of clk if write_en =1. (syncronous write)
- Reading happen immediately after address is changed. (asynchronous)  

```verilog
  input [3:0]        address,
  input [7:0]        data_in,
  input              write_en,
  input              clk,

  output [7:0]       data_out
```

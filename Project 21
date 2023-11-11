# Project21
Design and verify a 32bit X 8 depth synchronous FIFO.

## Interface Definition

```verilog
    input                          clk,
    input                          rst_n,
    input                           cs, - chip select, when 1 model is operational.
    input                           wr_en, - active high for data write.
    input [FIFO_WIDTH-1:0]          data_in, - Data input bus.
    input                           rd_en, - active high for data read.

    output reg [FIFO_WIDTH-1:0]     data_out, - Data output bus.
    output                          full, - when set, all FIFO locations are full.
    output                          empty - when set, all FIFO locations are empty.       
```

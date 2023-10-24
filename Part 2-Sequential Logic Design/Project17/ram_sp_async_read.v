`timescale 1us/1ns 
// Single port RAM with asynchronous read and synchronous write
// Size of the RAM is 16 x 8bit words 
module ram_sp_async_read(
  input [3:0] address,
  input [7:0] data_in,
  input write_en,
  input clk,
  output [7:0] data_out);
  
  reg [7:0] ram [0:15];
  
  always @(posedge clk) begin
    if (write_en)
      ram[address] <= data_in;
    end 
      
      assign data_out = ram[address];
    endmodule

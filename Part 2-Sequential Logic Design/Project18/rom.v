`timescale 1us/1ns 
module rom
  #(parameter WIDTH = 8,
    parameter DEPTH = 16,
    parameter LOG_DEPTH = $clog2(DEPTH))
  (
    input clk,
    input [LOG_DEPTH-1:0] address,
    output reg [WIDTH-1:0] data_out
  );
  
  reg [WIDTH-1:0] rom [0:DEPTH-1];
  
  //load rom with data from rom_init.hex
  initial begin 
    $readmemh("rom_init.hex",rom,0,DEPTH-1);
  end
  
  always @(posedge clk) begin
    data_out <= rom[address];
  end
  
endmodule
  

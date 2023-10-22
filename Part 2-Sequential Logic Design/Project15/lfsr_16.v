`timescale 1us/1ns 
module lfsr_4(
  input reset_n,
  input clk,
  input enable, // if 1, enables shifting 
  output reg [3:0] lfsr
);
  
  localparam RST_SEED = 4'b1110; 
  wire feedback;
  
  assign feedback = lfsr[1] ^ lfsr[3] ;
  
  always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      lfsr <= RST_SEED;
    else if(enable == 1'b1)
      lfsr <= {lfsr[3:0],feedback};
  end 
endmodule
      
  

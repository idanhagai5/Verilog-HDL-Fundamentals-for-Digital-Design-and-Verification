`timescale 1us/1ns 
module shift_left_right_reg(
  input reset_n,
  input clk,
  input [7:0] i, // 8 bit input
  input load_enable, // 1 for load and 0 for enable shifting
  input shift_left_right, // 0 for shift left and 1 for shift right
  output reg [7:0] q // 8 bit output
);
  
  // Async negative reset is used
  always @(posedge clk or negedge reset_n) begin 
    if (!reset_n)
      q <= 8'b0;
    else if (load_enable == 1 )
      q <= i;
    else begin 
      if(shift_left_right == 1'b0)
        q <= {q[6:0],1'b0};
      else
        q <= {1'b0,q[7:1]};
    end 
  end
endmodule 
        
        

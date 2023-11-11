`timescale 1us/1ns 
module up_down_counter
  #(parameter CNT_WIDTH =3)
  (input clk,
  input reset_n,
  input load, 
  input [CNT_WIDTH -1:0] counter_in,
   input up_down, // 1-up, 0-down
   output reg [CNT_WIDTH -1:0] counter_out
  );
  
  always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      counter_out <= 0;
    else if(load )
      counter_out <= counter_in;
    else begin 
      if(up_down == 1'b1)
        counter_out= counter_out+1'b1;
      else 
        counter_out=counter_out-1'b1;
    end
  end
endmodule
  

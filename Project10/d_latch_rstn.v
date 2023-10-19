`timescale 1us/1ns

module d_latch_rstn(
  input d,
  input enable,
  input rst_n,
  output q,
  output q_not 
);
  
  reg dlatch;
  
  always @(enable or d or rst_n) begin 
    if (!rst_n)
      dlatch <= 1'b0;
    else if (enable)
      dlatch <= d;
  end 
  
  assign q = dlatch;
  assign q_not = ~q;
  
endmodule 

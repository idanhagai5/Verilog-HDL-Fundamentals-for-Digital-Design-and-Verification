module adder_Nbit
  //parameter decleration
  #(parameter N=3)
  (input [N-1:0] a,
   input [N-1:0] b,
   output reg [N:0] sum
  );
  
  always @(*) sum = a + b;
  
endmodule 

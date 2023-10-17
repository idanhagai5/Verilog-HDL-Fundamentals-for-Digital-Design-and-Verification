module decoder_3to8(
  input [2:0] a,
  input enable,
  output reg [7:0] y
);
  
  always @(*) begin
    if (enable==0)
      y=0;
    else
      y=(1<<a);
  end
endmodule

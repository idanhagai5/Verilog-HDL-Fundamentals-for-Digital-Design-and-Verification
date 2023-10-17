module testbench();
  
  reg [3:0] a;
  reg [3:0] b;
  reg Cin;
  wire [4:0] sum;
  
  integer i,j,k; //used for verification
  
  
  //instantiate DUT
  ripple_adder_4bit_structural RA(
    .a(a),
    .b(b),
    .carry_in(Cin),
    .sum(sum[3:0]),
    .carry_out(sum[4])
  );
  
  initial $monitor("a=%d, b=%d, carry in=%d,sum=%d",a,b,Cin,sum);
  
  initial begin	
    for(i=0;i<16;i=i+1) begin 
      for(j=0;j<16;j=j+1) begin
        for (k=0;k<2;k=k+1)begin
          #1 a=i;b=j;Cin=k;
        end
      end
    end
  end
endmodule 

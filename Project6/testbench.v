module testbench();
  
  parameter ADDER_WIDTH=10;
  reg [ADDER_WIDTH-1:0] a;
  reg [ADDER_WIDTH-1:0] b;
  wire [ADDER_WIDTH:0] sum;
  
  //instantiate DUT  
  adder_Nbit
  //change value of parameter during instantiation
  #(.N(ADDER_WIDTH))
  d1(
    .a(a),
    .b(b),
    .sum(sum)
  );
  
  initial begin 
    $monitor("a=%d, b=%d, sum=%d",a,b,sum);
    a=0;b=0;
    #1 a=7;b=7;
    #1 a=33;b=66;
    #1 a=100;b=47;
    #1 a=1023;b=1023;
  end 
endmodule 
    

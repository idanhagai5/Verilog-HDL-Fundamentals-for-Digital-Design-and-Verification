module testbench();
  
  reg a;
  reg b;
  wire sum;
  wire carry;
  
  //instantiate DUT
  half_adder_structural HA1(a,b,sum,carry);
  
  initial $monitor("a=%d, b=%d,sum=%d, carry=%d",a,b,sum,carry);
  
  initial begin
    #1 a=0; b=0;
    #1 a=0; b=1;
    #1 a=1; b=0;
    #1 a=1; b=1;
  end 
endmodule 

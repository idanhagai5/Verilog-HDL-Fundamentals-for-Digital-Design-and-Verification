module testbench();
  
  reg a;
  reg b;
  reg Cin;
  wire sum;
  wire Cout;
  
  //instantiate DUT
  full_adder_structural FA(
    .a(a),
    .b(b),
    .carry_in(Cin),
    .sum(sum),
    .carry_out(Cout)
  );
  
  initial $monitor("a=%d, b=%d, carry in=%d,sum=%d, carry out=%d",a,b,Cin,sum,Cout);
  
  initial begin
    a=0; b=0; Cin=0;
    #1 a=0; b=0; Cin=1;
    #1 a=0; b=1; Cin=0;
    #1 a=0; b=1; Cin=1;
    #1 a=1; b=0; Cin=0;
    #1 a=1; b=0; Cin=1;
    #1 a=1; b=1; Cin=0;
    #1 a=1; b=1; Cin=1;
  end 
endmodule 

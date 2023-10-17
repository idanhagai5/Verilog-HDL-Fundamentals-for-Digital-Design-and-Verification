module testbench();
  
  reg [3:0] a;
  wire [15:0] d;
  
  integer i;
  
  //instantiate DUT
  decoder_4to16 d1(a,d);
  
  initial begin 
    $monitor("a=%d, d=%b",a,d);
    for(i=0;i<16;i++) begin
      #1 a=i;
    end
  end
endmodule

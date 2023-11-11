module testbench();
  
  reg a;
  reg b;
  reg sel;
  wire y;
  
 integer i,j,k;
  
  //instantiate DUT
  mux_1bit mux1(a,b,sel,y);
  
  
  initial $monitor("a=%d, b=%d, sel=%d, y=%d",a,b,sel,y);

  initial begin 
    for (i=0;i<2;i++)  begin
      for (j=0;j<2;j++) begin
        for (k=0;k<2;k++) begin
          	#1 a=i;b=j;sel=k;
        end
      end
    end
  end
    // Dump VCD
  initial begin
    $dumpfile("mux_1bit.vcd");
    $dumpvars(2, testbench);
  end
endmodule
        

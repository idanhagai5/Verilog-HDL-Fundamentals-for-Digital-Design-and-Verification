`timescale 1us/1ns 
module tb_lfsr_16();
  
  reg reset_n;
  reg clk = 0;
  reg enable;
  wire [15:0] lfsr;
  
  //instantiate DUT
  lfsr_16 LFSR (reset_n, clk, enable, lfsr);
  
    //create a 1MHz clock signal 
  always begin #0.5 clk=~clk; end
  
  initial begin 
    $monitor ($time,"enable = %b, lfsr = %16b", enable, lfsr);
    #1 ; reset_n = 0; enable = 0; // apply reset 
    #1.3 ; reset_n=1; // release reset 
    repeat(2) @(posedge clk) ;
    enable=1;
    
    repeat(10)  @(posedge clk) ;
    enable=0;
  end
  
       initial begin 
      $dumpfile("lfsr_16.vcd");
      $dumpvars(0, tb_lfsr_16);
    #20 $finish; // stop simulator
  end
endmodule


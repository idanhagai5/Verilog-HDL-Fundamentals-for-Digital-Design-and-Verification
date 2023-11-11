`timescale 1us/1ns 
module tb_shift_reg_siso();
  
  reg reset_n;
  reg clk=0;
  reg sdi;
  wire sdo;
  
  //instantiate DUT 
  shift_reg_siso SISO (reset_n , clk , sdi , sdo);
  
  //create clock signal 
  always begin #0.5 clk=~clk; end
  
  //create stimulus 
  initial begin 
    #1 
    reset_n=0; sdi=0;
    #1.3 
    reset_n =1;
    
    //set sdi for 1 clock 
    @(posedge clk); sdi=1'b1;  @(posedge clk); sdi=1'b0;
    
    //wait for the bit to shift
    repeat(4) @(posedge clk);
    @(posedge clk); sdi=1'b1;
    @(posedge clk); 
    @(posedge clk); sdi=1'b0;
  end
  
    initial begin 
      $dumpfile("shift_reg_siso.vcd");
      $dumpvars(0, tb_shift_reg_siso);
    #40 $finish; // stop simulator
  end
endmodule

`timescale 1us/1ns 
module tb_shift_left_right_load_reg();
  
  reg reset_n;
  reg clk = 0;
  reg [7:0] i;
  reg load_enable;
  reg shift_left_right;
  wire [7:0] q;
  
  //instantiate DUT
  shift_left_right_reg SLR (reset_n, clk, i, load_enable, shift_left_right, q);
  
    //create clock signal 
  always begin #0.5 clk=~clk; end
  
  initial begin 
    $monitor("i=%8b, load_enable=%b, shift_left_right=%b, q=%8b",i,load_enable,shift_left_right,q);
    
    //apply reset to the circut 
    reset_n=0; i=0; load_enable=0; shift_left_right=0;
    #1.3 load_enable=1; reset_n=1; // release reset 
    
    //set value of i 
    @(posedge clk); i=8'b1111_1111;
    @(posedge clk); load_enable=1'b0; // ebale shifting left
    
    //wait for the bits to shift left 
    repeat(8)  @(posedge clk); load_enable=1; i=8'b1010_1000;
    @(posedge clk); load_enable=0; shift_left_right=1;
  end 
  
      initial begin 
      $dumpfile("shift_left_right_load_reg.vcd");
      $dumpvars(0, tb_shift_left_right_load_reg);
    #40 $finish; // stop simulator
  end
    
endmodule
  
  

`timescale 1us/1ns
module tb_d_latch_rstn();
  
  reg d;
  reg enable;
  reg rst_n;
  wire q;
  wire q_not;
  
  //instantiate DUT 
  d_latch_rstn LATCH (d,enable,rst_n,q,q_not);
  
  // create stimulus 
  initial begin 
    enable = 0; rst_n=0;
    #0.2 d=0;
    #0.5 d=1; rst_n=1;
    #1.5 enable =1; 
    #0.1 d=1;
    #0.2 d=0;
    #0.3 d=1;
    #1 d=0; enable =0;
    #1 d=1; rst_n=0;
    #2 d=0; enable=1;
  end 
  
  
  initial begin 
    $dumpfile("d_latch_rstn.vcd");
    $dumpvars(0, tb_d_latch_rstn);
    #8 $finish;
  end
endmodule 
  

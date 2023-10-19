`timescale 1us/1ns 
module tb_d_ff_sync_rstn();
  
  reg d;
  reg clk = 0;
  reg reset_n;
  wire q;
  wire q_not; 
  
  reg [1:0] delay;
  integer i;
  
  //instantiate DUT 
  d_ff_sync_rstn DFF1 (
    .d(d),
    .clk(clk),
    .reset_n(reset_n),
    .q(q),
    .q_not(q_not)
  );
  
  //create clk signal
  always begin 
    #0.5 clk=~clk; 
  end
  
  //create stimulus 
  initial begin 
    reset_n=0; d=0;
    for(i=0;i<4;i++) begin 
      delay=$urandom_range(1,3);
      #(delay) d=~d;
    end
    
    reset_n=1; 
    for(i=0;i<4;i++) begin 
       delay=$urandom_range(1,3);
      #(delay) d=~d; // toggle the FF at random times
    end
    
    d=1'b1;
    #0.2 reset_n =0;
  end
  
  initial begin 
    $dumpfile("d_ff_sync_rstn.vcd");
    $dumpvars(0, tb_d_ff_sync_rstn);
    #20 $finish; // stop simulator
  end
  
endmodule 
  
  

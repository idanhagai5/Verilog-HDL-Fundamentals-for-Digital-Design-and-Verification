`timescale 1us/1ns 
module tb_up_down_counter();
  
  parameter CNT_WIDTH = 3;
  reg clk = 0;
  reg reset_n;
  reg load;
  reg [CNT_WIDTH -1:0] counter_in;
  reg up_down;
  wire [CNT_WIDTH -1:0] counter_out;
  
  //instantiate DUT 
  up_down_counter
  #(.CNT_WIDTH(CNT_WIDTH))
  CNT_UP_DOWN (
    .clk(clk),
    .reset_n(reset_n),
    .load(load),
    .counter_in(counter_in),
    .up_down(up_down),
    .counter_out(counter_out)
  );
  
      //create a 1MHz clock signal 
  always begin #0.5 clk=~clk; end
  
  initial begin
    $monitor("load = %b,  up_down=%b, counter_in=%d, counter_out=%d",load,up_down,counter_in,counter_out);
    #1 ; reset_n =0;up_down=0;load=0;counter_in=0;
    #1.2 reset_n=1;
    @(posedge clk);
    repeat(2) @(posedge clk); counter_in=3; load=1;
    @(posedge clk); load =0; up_down=1; // count up
    
    wait (counter_out == 0) up_down =0; // count down
  end
  
         initial begin 
         $dumpfile("up_down_counter.vcd");
         $dumpvars(0, tb_up_down_counter);
    #20 $finish; // stop simulator
  end
endmodule
  

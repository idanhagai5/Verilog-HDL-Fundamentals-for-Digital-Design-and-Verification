`timescale 1us/1ns
module tb_seq_det_non_overlaping();
  
  reg clk = 0;
  reg rst_n;
  reg seq_in;
  wire detected;
  wire [1:0] state_out;
  
  reg [13:0] test_vect = 14'b00_1100_0101_0101;
  integer i;
  
  //instantiate DUT 
  seq_det_non_overlaping SEQ_DET (
    .clk(clk),
    .rst_n(rst_n),
    .seq_in(seq_in),
    .detected(detected),
    .state_out(state_out)
  );
  
  //clock signal
  always begin #1 clk=~clk; end
  
  initial begin 
    $monitor($time,"seq in=%b, detected=%b",seq_in,detected);
    
    rst_n=0; #2.5 rst_n=1;
    repeat(2) @(posedge clk); // wait some time 
    
    for (i=0;i<14;i=i+1) begin
      seq_in = test_vect[i];
      @(posedge clk);
    end
    
    for (i=0;i<15;i=i+1) begin
      seq_in = $random;
      @(posedge clk);
    end
    
    repeat(10) @(posedge clk);
    @(posedge clk);
    
    $finish;
  end 
  
           initial begin 
         $dumpfile("seq_det_non_overlaping.vcd");
             $dumpvars(0, tb_seq_det_non_overlaping);
  end
endmodule

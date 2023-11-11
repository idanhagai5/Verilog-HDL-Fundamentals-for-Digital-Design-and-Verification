`timescale 1us/1ns 
module tb_rom();
  
  parameter WIDTH=8;
  parameter DEPTH=16;
  parameter LOG_DEPTH = $clog2(DEPTH);
  reg clk =0;
  reg [LOG_DEPTH-1:0] address;
  wire [WIDTH-1:0] data_out;
  integer i;
  
  //instantiate DUT 
  rom 
  #(.WIDTH(WIDTH),
    .DEPTH(DEPTH))
  ROM1
  (
    .clk(clk),
   .address(address),
   .data_out(data_out)
  );
  
    // create the clock signal
  always begin #0.5 clk=~clk; end
  
  task read_data(input [LOG_DEPTH-1:0] address_i);
    begin 
      @(posedge clk);
      address = address_i;
      @(posedge clk);
      #1 // wait for data to propogate
      $display("address=%2d, data=%2x",address,data_out);
    end
  endtask
  
  initial begin 
    $display("ROM content:");
    for(i=0;i<DEPTH;i++) begin 
      read_data(i);
    end
    $finish;
  end
endmodule

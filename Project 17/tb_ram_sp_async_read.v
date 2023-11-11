`timescale 1us/1ns 
module tb_ram_sp_async_read();
  
  reg [3:0] address;
  reg [7:0] data_in;
  reg write_en; 
  reg clk=0;
  wire [7:0] data_out;
  reg [1:0] delay;
  reg [7:0] wr_data;
  integer success_count, error_count,test_count;
  integer i;
  
  //instantiate DUT 
  ram_sp_async_read RAM (
    .address(address),
    .data_in(data_in),
    .write_en(write_en),
    .clk(clk),
    .data_out(data_out));
  
  //connected to module's ports 
  task write_data(input [7:0] d_in,input [3:0] address_in);
    begin
      @(posedge clk);
      write_en = 1;
      address=address_in;
      data_in = d_in;
    end 
  endtask
  
  task read_data (input [3:0] address_in);
    begin
       @(posedge clk);
      write_en = 0;
      address = address_in;
    end
  endtask
  
  // compare write data with observed data
  task compare_data (input [3:0] address, input [7:0] expected_data, input [7:0] observed_data );
    begin 
      if ( expected_data === observed_data) begin 
        $display("SUCCESS ! address = %d, expected = %2x, observed = %2x",address,expected_data,observed_data);
        success_count = success_count+1;
      end
      else begin 
        $display("FAILED ! address = %d, expected = %2x, observed = %2x",address,expected_data,observed_data);
        error_count = error_count+1;
      end
      test_count= test_count+1;
    end
  endtask
  
  // create the clock signal
  always begin #0.5 clk=~clk; end
  
  // create stimulus
  initial begin 
    #1 
    //clear statistics 
    success_count=0; error_count=0; test_count=0;
    #1.5
    for (i=0;i<16;i=i+1) begin 
      wr_data=$random;
      write_data(wr_data,i); // write data to RAM
      read_data(i); 
      compare_data(i, wr_data, data_out);
      delay=$random;
      #(delay);
    end
    
    $display("TEST RESULTS: success: %d, error: %d, tests: %d",success_count,error_count,test_count);
    $finish;
    
  end
  initial begin 
         $dumpfile("ram_sp_async_read.vcd");
         $dumpvars(0, tb_ram_sp_async_read);
  end
  
endmodule
  
 
  
  

`timescale 1us/1ns
module fifo_sync 
  #( parameter FIFO_DEPTH = 8 ,
    parameter FIFO_WIDTH = 32)
  (
    input clk,
    input rst_n,
    input cs,   // chip select 
    input wr_en,
    input rd_en,
    input [FIFO_WIDTH-1:0] data_in,
    output reg [FIFO_WIDTH-1:0] data_out,
    output empty,
    output full);
  
  localparam FIFO_DEPTH_LOG = $clog2(FIFO_DEPTH);
  
  reg [FIFO_WIDTH-1:0] fifo [0:FIFO_DEPTH-1];
  
  // rd/wr pointers have 1 extra bit at MSB
  
  reg [FIFO_DEPTH_LOG:0] rd_pointer;
  reg [FIFO_DEPTH_LOG:0] wr_pointer;
  
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      wr_pointer <= 0;
    else if (cs & wr_en & !full) 
      wr_pointer <= wr_pointer + 1'b1;
  end
  
   always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      rd_pointer <= 0;
     else if (cs & rd_en & !empty)
      rd_pointer <= rd_pointer + 1'b1;
  end
  
    assign empty = (rd_pointer == wr_pointer);
    assign full = (rd_pointer == {~wr_pointer[FIFO_DEPTH_LOG],wr_pointer[FIFO_DEPTH_LOG-1:0]});
  
   always @(posedge clk or negedge rst_n) begin
     if (cs & wr_en & !full)begin
      fifo[wr_pointer[FIFO_DEPTH_LOG-1:0]] <= data_in;
     end
  end
  
    always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      data_out <= 0;
      else if (cs & rd_en & !empty) begin
       data_out <= fifo[rd_pointer[FIFO_DEPTH_LOG-1:0]];
      end   
  end
  
endmodule
  
  
      
  
    
    

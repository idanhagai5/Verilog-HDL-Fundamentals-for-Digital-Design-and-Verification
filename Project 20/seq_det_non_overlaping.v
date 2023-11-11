`timescale 1us/1ns
module seq_det_non_overlaping(
  input clk,
  input rst_n,
  input seq_in,
  output reg detected,
  output [1:0] state_out // used for debag
);
  
  parameter [1:0] S1 = 2'b01, 
                  S10 = 2'b10, 
                  S101 = 2'b11; 
  
  reg [1:0] state;
  reg [1:0] next_state;
  
  always @(*) begin 
    detected = 1'b0;
    case (state)
      
      S1: begin                // wait for the first 1
        if ( seq_in === 1 )
          next_state = S10;
        else
          next_state = S1;
      end
      
      S10: begin               // wait next for 0
        if ( seq_in === 1'b0 )
          next_state = S101;
        else
          next_state = S10;
      end
      
     S101: begin              // wait next for 1 
       if ( seq_in === 1'b1 ) 
          detected=1;
        next_state = S1;
      end
      
      default: next_state = S1;
    endcase
    
  end
  
    //state sequencer
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      state <= S1;
    else 
      state <= next_state;
  end 
  
  assign state_out = state;  // connect "state" with output port.
endmodule
      
        
    

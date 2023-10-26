`timescale 1us/1ns
module semaphore_fsm(
  input clk,
  input reset_n,
  input enable,
  output reg red,
  output reg yellow,
  output reg green,
  output [3:0] state_out // used for debag 
);
  
  //Declare the state values as parameters 
  parameter [3:0] OFF= 4'b0001,
  				  RED= 4'b0010,
                  YELLOW= 4'b0100,
                  GREEN= 4'b1000;
  
  //Declare the logic for the state mechine
  reg [3:0] state;
  reg [3:0] next_state;
  
  
  reg [5:0] timer; // counter that keeps the gate open 
  reg       timer_clear; // when set, reset the timer
  
  always @(*) begin 
    next_state =  OFF;
    red =         0;
    green =       0;              // default values
    yellow =      0;
    timer_clear = 0;
    case(state) 
      
      OFF         :begin
                  if(enable)
                     next_state = RED;
                   end
      
      RED        :begin
                   red = 1;
                   if (timer == 6'd50) begin
                    next_state = YELLOW;
                    timer_clear = 1;
                   end else begin 
                    next_state = RED;
                   end
                  end
      
      YELLOW      :begin
                   yellow = 1;
                   if (timer == 6'd10) begin
                    next_state = GREEN;
                    timer_clear = 1;
                   end else begin 
                    next_state = YELLOW;
                   end
                  end
      
      GREEN      :begin
                   green = 1;
                   if (timer == 6'd30) begin
                    next_state = RED;
                    timer_clear = 1;
                   end else begin 
                    next_state = GREEN;
                   end
                  end
      
      default: next_state = OFF;
    endcase
    
    // return from any state to OFF if enable ==0
    if (!enable)
      next_state = OFF;
    
  end
  
  //state sequencer
  always @(posedge clk or negedge reset_n) begin
    if(!reset_n)
      state <= OFF;
    else 
      state <= next_state;
  end 
  
  assign state_out = state;
  
  //timer logic
  always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      timer <= 0;
    else if (timer_clear || !enable )
      timer <= 0;
    else if ( state != OFF ) // increament timer if state != OFF
      timer <= timer + 1'b1;
  end
endmodule 
    
        
                  
      
    
  

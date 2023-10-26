`timescale 1us/1ns
module tb_semaphore_fsm();
  
  reg clk = 0;
  reg reset_n;
  reg enable;
  wire red;
  wire yellow;
  wire green;
  wire [3:0] state_out;
  
  parameter [3:0] OFF= 4'b0001,
  				  RED= 4'b0010,
                  YELLOW= 4'b0100,
                  GREEN= 4'b1000;
  
  //instantiate DUT 
  
  semaphore_fsm SEM1 (
    .clk(clk),
    .reset_n(reset_n),
    .enable(enable),
    .red(red),
    .yellow(yellow),
    .green(green),
    .state_out(state_out)
  );
  
  //create clock signal 
  initial begin 
    forever begin 
      #1 clk=~clk;
    end
  end
  
  initial begin 
    $monitor("enable = %b, red = %b, yellow = %b, green = %b",enable,red,yellow,green);
    reset_n = 1; #2.5; reset_n=1; // reset sequence
    enable=0;
    repeat(10) @(posedge clk); // wait some time 
    enable = 1;
    
    //let the semaphore cycle 2 times: 
    repeat(2) begin 
      wait(state_out === GREEN) 
      @(state_out); // wait for a change in state_out (GREEN)
    end
    
    //Disable the semaphore at yellow state
    wait (state_out === YELLOW)
    @(posedge clk); enable = 0;
    
    repeat(10) @(posedge clk);
    @(posedge clk) ;enable = 1;
    
    #40 $finish;
  end
  initial begin 
         $dumpfile("semaphore_fsm.vcd");
    $dumpvars(0, tb_semaphore_fsm);
     
  end
  
endmodule
    
  
  
  

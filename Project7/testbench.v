module testbench();
  
  parameter DEC_WIDTH=4;
  reg [DEC_WIDTH-1:0] a;
  reg enable;
  wire [2**DEC_WIDTH-1:0] y;
  
  integer i;
  
  //instantiate DUT 
  decoder_Nbit 
  #(.N(DEC_WIDTH))
  d1(.a(a),
     .enable(enable),
     .y(y)
    );
  
  initial begin 
    $monitor("a= %d, enable=%b, y=%b",a,enable,y);
    a=1;enable=0;
    for(i=0;i<2**DEC_WIDTH;i++) begin
      #1 a=i;enable=1;
    end
  end
endmodule
  
  

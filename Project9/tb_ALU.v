module tb_ALU();
  
  parameter BUS_WIDTH = 8;
  reg [BUS_WIDTH-1:0] a;
  reg [BUS_WIDTH-1:0] b;
  reg carry_in;
  reg [3:0] opcode;
  wire [BUS_WIDTH-1:0] y;
  wire carry_out;
  wire borrow;
  wire zero;
  wire parity;
  wire invalid_op; 
  
  //instantiate DUT
  ALU
  #(.BUS_WIDTH(BUS_WIDTH))
  ALU1(
    .a               (a         ),
    .b               (b         ),
    .carry_in        (carry_in  ),
    .opcode          (opcode    ),
    .y               (y         ),
    .carry_out       (carry_out ),
    .borrow          (borrow    ),
    .zero            (zero      ),
    .parity          (parity    ),
    .invalid_op      (invalid_op)
  );
  
  //create stimulus
  initial begin 
    $monitor("opdode=%d, a=%d , b=%d, carry_in=%b, y=%d , carry_out=%b , borrow=%b , zero=%b, parity=%b,invalid op=%b", opcode, a, b, carry_in, y, carry_out, borrow, zero, parity, invalid_op);
    
    #1 $display("\nTest INVALID_OP");
    opcode=0; a=0; b=0; carry_in=0;
    
    #1 $display("\nTest OP_ADD");
    opcode=1; a=9; b=33; carry_in=0;
    
    #1 $display("\nTest OP_ADD_CARRY");
    opcode=2; a=9; b=33; carry_in=1;
    
    #1 $display("\nTest OP_SUB");
       opcode=3; a=65; b=64; carry_in=0;
    #1 opcode=3; a=5; b=8; carry_in=0;
    
    #1 $display("\nTest OP_INC");
       opcode=4; a=223; b=69; carry_in=0;
    
    #1 $display("\nTest OP_DEC");
    opcode=5; a=1; b=3; carry_in=0;

    #1 $display("\nTest OP_AND");
    opcode=6; a=8'b0000_0010; b=8'b0000_0011;
    
    #1 $display("\nTest OP_NOT");
    opcode=7; a=8'b0000_0010; b=8'b0000_0001;
    
    #1 $display("\nTest OP_ROL");
    opcode=8; a=8'b0000_0001; 
    
    #1 $display("\nTest OP_ROR");
    opcode=9; a=8'b1000_0000; 
    
    #1 $finish;
  end
endmodule
    
             
    

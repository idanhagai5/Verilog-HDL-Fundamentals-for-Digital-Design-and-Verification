module ALU
  #(parameter BUS_WIDTH = 8)
  (input [BUS_WIDTH-1:0] a,
   input [BUS_WIDTH-1:0] b,
   input carry_in,
   input [3:0] opcode,
   output reg [BUS_WIDTH-1:0] y,
   output reg carry_out,
   output reg borrow,
   output zero,
   output parity,
   output reg invalid_op
  );
  
  // define a list of opcodes
  localparam OP_ADD = 1; // A+B
  localparam OP_ADD_CARRY = 2; // A+B+Carry_in
  localparam OP_SUB = 3; // A-B
  localparam OP_INC = 4; // y=A+1
  localparam OP_DEC = 5; // y=A-1
  localparam OP_AND = 6; // Bitwise AND
  localparam OP_NOT = 7; // NOT A
  localparam OP_ROL = 8; // Rotate left A
  localparam OP_ROR = 9; // Rotate right A
  
  always @(*) begin 
    y=0; carry_out=0; borrow=0; invalid_op=0;
    case(opcode)
      OP_ADD       : {carry_out,y}= a + b;
      OP_ADD_CARRY : {carry_out,y}= a + b + carry_in;
      OP_SUB       : {borrow,y}= a - b;
      OP_INC       : {carry_out,y}= a + 1'b1;
      OP_DEC       : {borrow,y}= a - 1'b1;
      OP_AND       : y= a & b;
      OP_NOT       : y= ~a;
      OP_ROL       : y={a[BUS_WIDTH-2:0], a[BUS_WIDTH-1]};
      OP_ROR       : y={a[0],a[BUS_WIDTH-1:1]};
      default      : invalid_op = 1;
    endcase 
  end
  
  assign parity = ^y;
  assign zero = (y==0);
endmodule 
   

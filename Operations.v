module Adder (
//input rst_n,                              //low active async reset. 
  input [3:0] operand1,
  input [3:0] operand2,
  output reg [7:0] result                  // max result could be 8 bits... due to mult opr
//  output integer result                 // alternatively 32 bit integer could be used.
);
  //assign result = operand1 + operand2;
  always @(operand1, operand2)
    result <= operand1 + operand2;
endmodule

 
module Subtractor (
  input [3:0] operand1,
  input [3:0] operand2,
  output reg [7:0] result
);
  always @(operand1, operand2)
    result <= operand1 - operand2;
endmodule


module Multiplier (
  input [3:0] operand1,
  input [3:0] operand2,
  output reg [7:0] result
);
  always @(operand1, operand2)
    result <= operand1 * operand2;
endmodule


module Divider (
  input [3:0] operand1,
  input [3:0] operand2,
  output reg [7:0] quotient
);
  always @(operand1, operand2)
    begin
      quotient <= operand1 / operand2;
    end
endmodule


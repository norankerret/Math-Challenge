module random1(
  input clk,
  output reg [2:0] num
);

reg [3:0] lfsr = 4'b1000; // Non-zero initial value

always @(negedge clk) begin
  lfsr = {lfsr[2:0], ~(lfsr[3] ^ lfsr[2])}; // LFSR update

  // Limit the output to the range of 0 to 5
  if (lfsr >= 6) begin
    num <= 5; // If lfsr exceeds 5, set num to 5
  end else begin
    num <= lfsr[2:0]; // Take the lower 3 bits of lfsr
  end
end

endmodule


module random(
  input clk,
  output reg [2:0] num
);

reg [3:0] lfsr = 4'b1010; // Non-zero initial value

always @(negedge clk) begin
  lfsr = {lfsr[2:0], ~(lfsr[3] ^ lfsr[2])}; // LFSR update

  // Limit the output to the range of 0 to 5
  if (lfsr >= 6) begin
    num <= 5; // If lfsr exceeds 5, set num to 5
  end else begin
    num <= lfsr[2:0]; // Take the lower 3 bits of lfsr
  end
end

endmodule



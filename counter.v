
module counter(clk, counter, sw, reset);


	input clk;
	input sw;
	input reset; 
	reg countdown = 1;
 
	output reg [3:0] counter;
	 
	initial begin
		counter <= 4'b1000;  
	end


  always @(posedge clk or negedge reset) begin  

			if(~reset) begin 
					counter <= 4'b1111; 
			end else if (~sw) begin 
					counter <= 4'b1010;
					end 
			else if(counter!= 4'b0000) begin
					counter <= counter - 1; 
			end
	end 
    	 
endmodule


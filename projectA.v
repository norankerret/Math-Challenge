module projectA ( input [1:0] mode,input [3:0] inputs, input submit, input check, input clk, input times, 
	output [7:0] num1, output  [7:0] num2, output  [7:0] answer, output [9:0] light,
	output  [7:0] hex4,output  [7:0] hex5,output  [7:0] hex3);
	
	
	//assign hex4 = 7'b1111111;
	assign hex5 = 7'b1110110;
	
	
	reg correct; 
	wire [3:0] storage; 
	wire [3:0] storage1;
	wire [3:0] storage2;
	wire [3:0] storage3;
	
	reg [3:0] finally; 
	
	wire outclock;
	wire [4:0] counter;
	
	reg [7:0] result; 
	
	wire modes; 
	
	reg [9:0] counting; 
	reg [9:0] thisIsTheEnd;
	
	
	reg [3:0] random_number;
	wire [3:0] number1; 
	wire [3:0] number2; 
	
	random1 rand1(submit,number1); 
	random rand2(submit,number2);
	
	lab2 a(number1, num1); 
	lab2 b(number2, num2); 
	
	wire reset; 
	
	wire [3:0] blinks; 
	SlowClockDivider cd(clk, outclock); 
	counter dc(outclock,blinks, times, submit); 
	lab2 lab21(blinks,hex3);
	//module counter(clk, counter, sw, reset);
	

	
		//sum : p, sub :s , devide : d , mult: C 
		
	always @(mode)
  begin
    case (mode)			  
	   2'b00  : result <= 7'b0001100;//p 
      2'b01  : result <= 7'b0010010;//s
		2'b10  : result <= 7'b1000110;//c
      2'b11  : result <= 7'b0100001;//d
    endcase
  end
	
	
	assign hex4 = result; 
	lab2 c(inputs, answer); 
	
 
	assign storage = number1 + number2;
	assign storage1 = number1 - number2;
	assign storage2 = number1 * number2;
	assign storage3 = number1 / number2;
	
	
	always @(negedge check)
	begin
	if (mode == 2'b00)
	begin
	finally = storage;
	end
	else  if (mode == 2'b01)
	begin
	finally = storage1;
	end
	else  if (mode == 2'b01)
	begin
	finally = storage2;
	end
	else begin 
	finally = storage3;
	end
	end

	
	//lab2 d(storage, hex3);


	always @(posedge check)begin 
	if (finally == inputs)begin 
	counting <= counting + 1; 
	end
	end
	
	always @(counting)
  begin
    case (counting)			 
	   1  : thisIsTheEnd <= 10'b1111111110;//p 
      2  : thisIsTheEnd <= 10'b1111111100;//s
		3  : thisIsTheEnd <= 10'b1111111000;//c
      4  : thisIsTheEnd <= 10'b1111110000;//d
		5  : thisIsTheEnd <= 10'b1111100000;//d
		6  : thisIsTheEnd <= 10'b1111000000;//d
		7  : thisIsTheEnd <= 10'b1110000000;//d
		8  : thisIsTheEnd <= 10'b1100000000;//d
		9  : thisIsTheEnd <= 10'b1000000000;//d
		10 : thisIsTheEnd <= 10'b0000000000;//d
		default  : thisIsTheEnd <= 10'b1111111111;//d
    endcase
  end
	 
	assign light = thisIsTheEnd;
	
	endmodule 
	


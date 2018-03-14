`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:44:15 02/26/2018 
// Design Name: 
// Module Name:    digits 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module digits(my_input, defusal_code, send, correct, numCorrect);
	 input [15:0] my_input; //connected to pmod input
	 input [15:0] defusal_code;
	 input send;
	 output reg correct = 0;
	 output reg [3:0] numCorrect;
	
	wire digit3, digit2, digit1, digit0;
	assign digit3 = defusal_code[15:12];
	assign digit2 = defusal_code[11:8];
	assign digit1 = defusal_code[7:4];
	assign digit0 = defusal_code[3:0];
	always @(send) begin
		/*if(defusal_code == my_input) begin
			numCorrect <= 4'b100;
		end*/
		numCorrect <= 4'b0000;
		if(digit3 == my_input[15:12]) begin
			numCorrect <= numCorrect + 1;
		end
		if(digit2 == my_input[11:8]) begin
			numCorrect <= numCorrect + 1;
		end
		if(digit1 == my_input[7:4]) begin
			numCorrect <= numCorrect + 1;
		end
		if(digit0 == my_input[3:0]) begin
			numCorrect <= numCorrect + 1;
		end
		//ssd d3(.num(4'b0), .seg(seg3));
		//ssd d2(.num(4'b0), .seg(seg2));
		//ssd d1(.num(4'b0), .seg(seg1));
		//ssd d0(.num(numCorrect), .seg(seg0));
		if (numCorrect == 4'b100) begin
			correct <= 1;
		end
		else begin
			correct <= 0;
		end 

	end

	 /*
	input [15:0] my_input;
	input [15:0] defusal_code;
	output correct;
	output reg [2:0] num_correct;
	
	always @(*) begin
			if(my_input[0] == defusal_code[0] || my_input[0] == defusal_code[1] || my_input[0] == defusal_code[2] || my_input[0] == defusal_code[3])
				num_correct = num_correct + 1;
			else if(my_input[1] == defusal_code[0] || my_input[1] == defusal_code[1] || my_input[1] == defusal_code[2] || my_input[1] == defusal_code[3])
				num_correct = num_correct + 1;
			else if(my_input[2] == defusal_code[0] || my_input[2] == defusal_code[1] || my_input[2] == defusal_code[2] || my_input[2] == defusal_code[3])
				num_correct = num_correct + 1;
			else if(my_input[3] == defusal_code[0] || my_input[3] == defusal_code[1] || my_input[3] == defusal_code[2] || my_input[3] == defusal_code[3])
				num_correct = num_correct + 1;
		end
		
	if(num_correct == 4)
		assign correct = 1;
	else 
		assign correct = 0;
		*/
	
endmodule

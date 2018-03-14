`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:55:10 03/09/2018
// Design Name:   digits
// Module Name:   E:/Lab4/comp_digits.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: digits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module comp_digits;

	// Inputs
	reg [15:0] my_input;
	reg [15:0] defusal_code;
	reg send;

	// Outputs
	wire correct;
	wire [3:0] numCorrect;

	// Instantiate the Unit Under Test (UUT)
	digits uut (
		.my_input(my_input), 
		.defusal_code(defusal_code), 
		.send(send), 
		.correct(correct), 
		.numCorrect(numCorrect)
	);

	initial begin
		// Initialize Inputs
		my_input = 16'b1010000000010010;
		defusal_code = 16'b1010000000010010;
		send = 0;

		// Wait 100 ns for global reset to finish
		#5;
		send = 1;
		#100;
        
		// Add stimulus here

	end
      
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:21:28 03/07/2018
// Design Name:   PmodKYPD
// Module Name:   E:/Lab4/keypad_test.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PmodKYPD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module keypad_test;

	// Inputs
	reg clk;

	// Outputs
	wire [6:0] seg;
	wire [27:0] num;

	// Bidirs
	reg [7:0] JAa;

	// Instantiate the Unit Under Test (UUT)
	PmodKYPD uut (
		.clk(clk), 
		.JAa(JAa), 
		.seg(seg), 
		.num(num)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		JAa = 8'b11111111;

		// Wait 100 ns for global reset to finish
		// Add stimulus here

	end
	always #5 clk = ~clk;
      
endmodule


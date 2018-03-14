`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:03:33 03/09/2018
// Design Name:   PmodKYPD
// Module Name:   E:/Lab4/kypd_tb.v
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

module kypd_tb;

	// Inputs
	reg clk;

	// Outputs
	wire [6:0] seg;
	wire [27:0] num;

	// Bidirs
	wire [7:0] JAa;

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
		JAa=8'b11111111;
		// Wait 100 ns for global reset to finish
		// Add stimulus here

	end
	always #5 clk = ~clk;
      
endmodule


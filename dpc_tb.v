`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:05:07 03/09/2018
// Design Name:   DisplayController
// Module Name:   E:/Lab4/dpc_tb.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DisplayController
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dpc_tb;

	// Inputs
	reg [3:0] DispVal;
	reg updated;

	// Outputs
	wire [6:0] segOut;
	wire [27:0] out_seg;

	// Instantiate the Unit Under Test (UUT)
	DisplayController uut (
		.DispVal(DispVal), 
		.updated(updated),
		.segOut(segOut), 
		.out_seg(out_seg)
	);

	initial begin
		// Initialize Inputs
		DispVal = 0;
		updated = 0;
		#5
		updated = 1;
		#5
		DispVal = 1;
		updated = 0;
		#5
		updated = 1;
		#5
		DispVal = 2;
		updated = 0;
		#5
		updated = 1;
		#5
		DispVal = 3;
		updated = 0;
		#5
		updated = 1;
		#5
		DispVal = 4;
		updated = 0;
		#5 
		updated = 1;

		// Wait 100 ns for global reset to finish
		// Add stimulus here

	end
      
endmodule


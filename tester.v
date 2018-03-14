`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:06:49 02/28/2018
// Design Name:   randomizer
// Module Name:   E:/Lab4/tester.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: randomizer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tester;

	// Bidirs
	reg rst;
	wire [15:0] val;

	// Instantiate the Unit Under Test (UUT)
	randomizer uut (
		.rst(rst),
		.next_number(val)
	);

	initial begin
		// Initialize Inputs
		rst <= 1;
		
		#100;
		rst <= 0;
      $display("%d %d %d %d",val[15:12], val[11:8], val[7:4], val[3:0]);
		#100;
		rst <= 1;
		
		#100;
		rst <= 0;
      $display("%d %d %d %d",val[15:12], val[11:8], val[7:4], val[3:0]);
		#100;
		rst <= 1;
		
		#100;
		rst <= 0;
      $display("%d %d %d %d",val[15:12], val[11:8], val[7:4], val[3:0]);
		#100;
		rst <= 1;
		
		#100;
		rst <= 0;
      $display("%d %d %d %d",val[15:12], val[11:8], val[7:4], val[3:0]);
#100;
		rst <= 1;
		
		#100;
		rst <= 0;
      $display("%d %d %d %d",val[15:12], val[11:8], val[7:4], val[3:0]);
#100;
		rst <= 1;
		
		#100;
		rst <= 0;
      $display("%d %d %d %d",val[15:12], val[11:8], val[7:4], val[3:0]);
#100;
		rst <= 1;
		
		#100;
		rst <= 0;
      $display("%d %d %d %d",val[15:12], val[11:8], val[7:4], val[3:0]);
#100;
		rst <= 1;
		
		#100;
		rst <= 0;
      $display("%d %d %d %d",val[15:12], val[11:8], val[7:4], val[3:0]);
#100;
		rst <= 1;
		
		#100;
		rst <= 0;
      $display("%d %d %d %d",val[15:12], val[11:8], val[7:4], val[3:0]);

#100;
		rst <= 1;
		
		#100;
		rst <= 0;
      $display("%d %d %d %d",val[15:12], val[11:8], val[7:4], val[3:0]);

#100;
		rst <= 1;
		
		#100;
		rst <= 0;
      $display("%d %d %d %d",val[15:12], val[11:8], val[7:4], val[3:0]);

#100;
		rst <= 1;
		
		#100;
		rst <= 0;
      $display("%d %d %d %d",val[15:12], val[11:8], val[7:4], val[3:0]);
#100;
		rst <= 1;
		
		#100;
		rst <= 0;
      $display("%d %d %d %d",val[15:12], val[11:8], val[7:4], val[3:0]);



	end
      
endmodule


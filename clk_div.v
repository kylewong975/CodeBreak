`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:00:25 02/07/2018 
// Design Name: 
// Module Name:    clk_div 
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

module clk_div(clk, rst, hz_fst);
	input clk, rst;
	output reg hz_fst;
	
	reg [31:0] count_fst;
	
	// equation: 100000000 / (2 * #Hz) - 1
	// 500 Hz clock (fast)
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			count_fst <= 32'b0;
			hz_fst <= 0;
		end
		else if (count_fst == 99999) begin 
			count_fst <= 32'b0;
			hz_fst <= ~hz_fst;
		end
		else
			count_fst <= count_fst + 32'b1;
	end

endmodule

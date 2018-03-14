`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:44:43 02/26/2018 
// Design Name: 
// Module Name:    speaker 
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
module speaker(clk, rst, activate_sound, victory, sndpin);
input clk;
input rst;
input activate_sound;
input victory;
output reg sndpin;

wire clk_low, clk_high, clk_choice;

clk_div2 dividers(.clk(clk), .hz_low(clk_low), .hz_high(clk_high));
always @(*) begin
	if (activate_sound)
		sndpin <= clk_low;
	else if(victory)
		sndpin <= clk_high;
	else
		sndpin <= 1;
end

endmodule

//producing high and low freq
module clk_div2(clk, rst, hz_low, hz_high);
	input clk;
	input rst;
	output reg hz_low, hz_high;
	
	reg [31:0] count_low;
	reg [31:0] count_high;

//low freq
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			count_low <= 32'b0;
			hz_low <= 0;
		end
		
		else if (count_low == 24999999) begin 
			count_low <= 32'b0;
			hz_low <= ~ count_low;
		end
		else
			count_low <= count_low + 32'b1;
	end
//high freq
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			count_high <= 32'b0;
			hz_high <= 0;
		end
		else if (count_high == 1999) begin 
			count_high <= 32'b0;
			hz_high <= ~ hz_high;
		end
		else
			count_high <= count_high + 32'b1;
	end
endmodule
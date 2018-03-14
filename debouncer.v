`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:26:17 02/26/2018 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(clk, btn, updated, btn_out);
	input clk, btn;
	output reg updated;
	output reg btn_out;
	
	reg [16:0] counter;
	
	always @(posedge clk) begin
		if(btn == 0) begin
			counter <= 17'b0;
			updated <= 0;
			btn_out <= 0;
		end
		else begin
			counter <= counter + 17'b1;
			if(counter == 16'b1111111111111111) begin
				counter <= 17'b0;
				updated <= 1;
				btn_out <= 1;
			end
			else begin
				updated <= 0;
			end
		end
	end


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:27:26 02/26/2018 
// Design Name: 
// Module Name:    randomizer 
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
module randomizer(
    input rst,
    output reg [15:0] next_number
);
	 
reg [15:0] out = 16'b1000100111010001;

always @(posedge rst) begin
		next_number[15]  = out[8]  ^ out[3] ^ out[3] ^ out[10];
		next_number[14]  = out[2]  ^ out[3] ^ out[14] ^ out[13];
		next_number[13]  = out[7]  ^ out[3] ^ out[12] ^ out[7];
		next_number[12]  = out[3]  ^ out[3] ^ out[11] ^ out[2];
		next_number[11]  = out[5]  ^ out[3] ^ out[15] ^ out[0];
		next_number[10]  = out[9]  ^ out[3] ^ out[4] ^ out[2];
		next_number[9]  = out[12]  ^ out[3] ^ out[1] ^ out[0];
		next_number[8]  = out[2]  ^ out[6] ^ out[1] ^ out[2];
		next_number[7]  = out[11]  ^ out[6] ^ out[3] ^ out[7];
		next_number[6]  = out[15]  ^ out[6] ^ out[2] ^ out[6];
		next_number[5]  = out[4]  ^ out[3] ^ out[5] ^ out[12];
		next_number[4]  = out[9]  ^ out[3] ^ out[8] ^ out[15];
		next_number[3]  = out[14]  ^ out[3] ^ out[12] ^ out[12];
		next_number[2]  = out[6]  ^ out[8] ^ out[7] ^ out[6];
		next_number[1]  = out[14]  ^ out[8] ^ out[12] ^ out[2];
      next_number[0]  = out[3]  ^ out[8] ^ out[5] ^ out[0]; 
		out = next_number;
end
endmodule

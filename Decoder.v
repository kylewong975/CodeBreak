`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc 2011
// Create Date:    07/23/2012 
//
// Module Name:    Decoder
// Project Name:   PmodKYPD_Demo
// Target Devices: Nexys3
// Tool versions:  Xilinx ISE 14.1 
// Description: This file defines a component Decoder for the demo project PmodKYPD. The Decoder scans
//					 each column by asserting a low to the pin corresponding to the column at 1KHz. After a
//					 column is asserted low, each row pin is checked. When a row pin is detected to be low,
//					 the key that was pressed could be determined.
//
// Revision History: 
//////////////////////////////////////////////////////////////////////////////////////////////////////////

// ==============================================================================================
// 												Define Module
// ==============================================================================================
module Decoder(
    clk,
    Row,
    Col,
    DecodeOut,
	 updated
    );

// ==============================================================================================
// 											Port Declarations
// ==============================================================================================
    input clk;						// 100MHz onboard clock
    input [3:0] Row;				// Rows on KYPD
    output [3:0] Col;			// Columns on KYPD
    output [3:0] DecodeOut;	// Output data
	 output reg updated;

// ==============================================================================================
// 							  		Parameters, Regsiters, and Wires
// ==============================================================================================
	
	// Output wires and registers
	reg [3:0] Col;
	reg [3:0] DecodeOut;
	
	// Count register
	reg [19:0] sclk;

// ==============================================================================================
// 												Implementation
// ==============================================================================================

	always @(posedge clk) begin

			// 1ms
			// 100,000
			if (sclk == 20'b00011000011010100000) begin
				//C1
				Col <= 4'b0111;
				updated <= 1;
				sclk <= sclk + 1'b1;
			end
			
			// check row pins
			else if(sclk == 20'b00011000011010101000) begin
				//R1
				if (Row == 4'b0111) begin
					updated <= 1;
					DecodeOut <= 4'b0001;		//1
				end
				//R2
				else if(Row == 4'b1011) begin
					updated <= 1;
					DecodeOut <= 4'b0100; 		//4
				end
				//R3
				else if(Row == 4'b1101) begin
					updated <= 1;
					DecodeOut <= 4'b0111; 		//7
				end
				//R4
				else if(Row == 4'b1110) begin
					updated <= 1;
					DecodeOut <= 4'b0000; 		//0
				end
				sclk <= sclk + 1'b1;
			end

			// 2ms
			else if(sclk == 20'b00110000110101000000) begin
				//C2
				Col<= 4'b1011;
				updated <= 1;
				sclk <= sclk + 1'b1;
			end
			
			// check row pins
			else if(sclk == 20'b00110000110101001000) begin
				//R1
				if (Row == 4'b0111) begin
					updated <= 1;
					DecodeOut <= 4'b0010; 		//2
				end
				//R2
				else if(Row == 4'b1011) begin
					updated <= 1;
					DecodeOut <= 4'b0101; 		//5
				end
				//R3
				else if(Row == 4'b1101) begin
					updated <= 1;
					DecodeOut <= 4'b1000; 		//8
				end
				//R4
				else if(Row == 4'b1110) begin
					updated <= 1;
					DecodeOut <= 4'b1111; 		//F
				end
				sclk <= sclk + 1'b1;
			end

			//3ms
			else if(sclk == 20'b01001001001111100000) begin
				//C3
				Col<= 4'b1101;
				updated <= 1;
				sclk <= sclk + 1'b1;
			end
			
			// check row pins
			else if(sclk == 20'b01001001001111101000) begin
				//R1
				if(Row == 4'b0111) begin
					updated <= 1;
					DecodeOut <= 4'b0011; 		//3	
				end
				//R2
				else if(Row == 4'b1011) begin
					updated <= 1;
					DecodeOut <= 4'b0110; 		//6
				end
				//R3
				else if(Row == 4'b1101) begin
					updated <= 1;
					DecodeOut <= 4'b1001; 		//9
				end
				//R4
				else if(Row == 4'b1110) begin
					updated <= 1;
					DecodeOut <= 4'b1110; 		//E
				end

				sclk <= sclk + 1'b1;
			end

			//4ms
			else if(sclk == 20'b01100001101010000000) begin
				//C4
				Col<= 4'b1110;
				updated <= 1;
				sclk <= sclk + 1'b1;
			end

			// Check row pins
			else if(sclk == 20'b01100001101010001000) begin
				//R1
				if(Row == 4'b0111) begin
					updated <= 1;
					DecodeOut <= 4'b1010; //A
				end
				//R2
				else if(Row == 4'b1011) begin
					updated <= 1;
					DecodeOut <= 4'b1011; //B
				end
				//R3
				else if(Row == 4'b1101) begin
					updated <= 1;
					DecodeOut <= 4'b1100; //C
				end
				//R4
				else if(Row == 4'b1110) begin
					updated <= 1;
					DecodeOut <= 4'b1101; //D
				end
				sclk <= 20'b00000000000000000000;
			end

			// Otherwise increment
			else begin
				sclk <= sclk + 1'b1;
				updated <= 0;
			end
			
	end
	


endmodule

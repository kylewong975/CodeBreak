`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc 2011
// Create Date:    07/23/2012 
//
// Module Name:    DisplayController
// Project Name:   PmodKYPD_Demo
// Target Devices: Nexys3
// Tool versions:  Xilinx ISE 14.1 
// Description: This file defines a DisplayController that controls the seven segment display that works with 
// 				 the output of the Decoder.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////

// ==============================================================================================
// 												Define Module
// ==============================================================================================
module DisplayController(
    DispVal,
	 updated,
    //anode,
    segOut,
	 out_seg
	 //fast
    );

// ==============================================================================================
// 											Port Declarations
// ==============================================================================================

    input [3:0] DispVal;			// Output from the Decoder
	 input updated;
	 //input fast;
    //output [3:0] anode;				// Controls the display digits
    output reg [6:0] segOut = 7'b0;			// Controls which digit to display
	 output reg [27:0] out_seg = 28'b0; // 4 digit ssd
	 //output [15:0] out_an; // 4 digit num

// ==============================================================================================
// 							  		Parameters, Regsiters, and Wires
// ==============================================================================================
	
	// Output wires and registers
	//reg [3:0] anode;
	//reg [6:0] segOut;
	//reg [27:0] out_seg;
	//reg [15:0] out_an;
	reg whichDigit;

// ==============================================================================================
// 												Implementation
// ==============================================================================================
	
	//------------------------------
	//		   Segment Decoder
	// Determines cathode pattern
	//   to display digit on SSD
	//------------------------------
	/*
	always @(posedge fast) begin
		if(whichDigit == 0) begin
			anode <= 4'b0111; // update 1st digit
			whichDigit <= 1;
		end
		else if(whichDigit == 1) begin
			anode <= 4'b1011; // update 2nd digit
			whichDigit <= 2;
		end // but don't blink on seconds
		else if(whichDigit == 2) begin
			anode <= 4'b1101; // update 3rd digit
			whichDigit <= 3;
		end
		else begin // 3
			anode <= 4'b1110; // update 4th digit
			whichDigit <= 0;
		end
	end
	*/
	
	always @(posedge updated) begin
			case (DispVal)
					4'h0 : segOut <= 7'b1000000;  // 0
					4'h1 : segOut <= 7'b1111001;  // 1
					4'h2 : segOut <= 7'b0100100;  // 2
					4'h3 : segOut <= 7'b0110000;  // 3
					4'h4 : segOut <= 7'b0011001;  // 4
					4'h5 : segOut <= 7'b0010010;  // 5
					4'h6 : segOut <= 7'b0000010;  // 6
					4'h7 : segOut <= 7'b1111000;  // 7
					4'h8 : segOut <= 7'b0000000;  // 8
					4'h9 : segOut <= 7'b0010000;  // 9
					4'hA : segOut <= 7'b0001000; 	// A
					4'hB : segOut <= 7'b0000011;	// B
					4'hC : segOut <= 7'b1000110;	// C
					4'hD : segOut <= 7'b0100001;	// D
					4'hE : segOut <= 7'b0000110;	// E
					4'hF : segOut <= 7'b0001110;	// F
					default : segOut <= 7'b0111111;
					
			endcase
			if(updated) begin
				out_seg <= (out_seg << 7) | segOut;
			end
			else begin
				out_seg <= out_seg;
			end
	end

endmodule

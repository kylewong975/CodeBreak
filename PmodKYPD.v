`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc 2011
// Create Date:    17:05:39 08/23/2011 
//
// Module Name:    PmodKYPD
// Project Name:   PmodKYPD_Demo
// Target Devices: Nexys3
// Tool versions:  Xilinx ISE 14.1 
// Description: This file defines a project that outputs the key pressed on the PmodKYPD to the 
//					 seven segment display.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////

// ==============================================================================================
// 												Define Module
// ==============================================================================================
module PmodKYPD(
    clk,
	 //fst,
    row,
	 //JAa,
	 col,
    //an,
    seg,
	 num
);
	 
	 
// ==============================================================================================
// 											Port Declarations
// ==============================================================================================
	input clk;					// 100Mhz onboard clock
	//input fst;
	//inout [7:0] JAa;
	input [3:0] row; 
	output [3:0] col;		// Port JA on Nexys3, JA[3:0] is Columns, JA[10:7] is rows
	//output [3:0] an;			// Anodes on seven segment display
	output [6:0] seg;			// Cathodes on seven segment display
	output [27:0] num;

// ==============================================================================================
// 							  		Parameters, Regsiters, and Wires
// ==============================================================================================
	
	// Output wires
	//wire [3:0] an;
	wire [6:0] seg;
	
	wire [3:0] Decode;
	wire update;

// ==============================================================================================
// 												Implementation
// ==============================================================================================

	//-----------------------------------------------
	//  						Decoder
	//-----------------------------------------------
	Decoder C0(
			.clk(clk),
			.Row(row),
			.Col(col),
			.DecodeOut(Decode),
			.updated(update)
	);

	//-----------------------------------------------
	//  		Seven Segment Display Controller
	//-----------------------------------------------
	DisplayController C1(
			.DispVal(Decode),
			.updated(update),
			//.anode(an),
			.segOut(seg),
			//.fast(fst)
			.out_seg(num)
	);

endmodule

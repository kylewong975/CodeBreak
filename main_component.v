`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:59:48 02/28/2018 
// Design Name: 
// Module Name:    main_component 
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
module main_component(JA, clk, rst, send, seg, an, Led, sndpin); 
	input clk, rst, send;
	
	inout [7:0] JA;
	output reg [6:0] seg; 
	output reg [3:0] an;
	output reg [7:0] Led;
	output sndpin;
	
	wire [3:0] digit3, digit2, digit1, digit0; // digits
	wire [6:0] seg3, seg2, seg1, seg0, updating; // seven segment display
	wire [15:0] correct_ans = 16'b1001110111111010;
	
	wire count_fst;
	wire btn_updated1; //rst
	wire btn_updated2; //send
	
	wire rst_tmp, send_tmp;
	
	wire [3:0] an_tmp;
	wire [6:0] seg_tmp;
	wire [27:0] seg_out;
	
	reg [31:0] whichDigit = 32'b0;
	reg [31:0] whichLed = 32'b0;
	
	reg activate_sound;
	reg vic;
	wire turnOnSound;
	wire victory;
	
	
	debouncer rst_btn(.clk(clk), .btn(rst), .updated(btn_updated1), .btn_out(rst_tmp));
	debouncer send_btn(.clk(clk), .btn(send), .updated(btn_updated2), .btn_out(send_tmp));
	always @(posedge clk or posedge rst_tmp or posedge send_tmp) begin
		if(rst_tmp) begin
			Led <= 8'b0;
			activate_sound <= 0;
			//whichLed <= 0;
		end
		else if(send_tmp) begin
			if(Led == 8'b0) begin
				Led <= 8'b1;//(Led << 1) | 8'b1;
				activate_sound <= 0;
				//whichLed <= 1;
			end
			else if(Led == 8'b1) begin
				Led <= 8'b11;//(Led << 1) | 8'b1;
				activate_sound <= 0;
				//whichLed <= 2;
			end
			else if(Led  == 8'b11) begin
				Led <= 8'b111;//(Led << 1) | 8'b1;
				activate_sound <= 0;
				//whichLed <= 3;
			end
			else if(Led == 8'b111) begin
				Led <= 8'b1111;//(Led << 1) | 8'b1;
				activate_sound <= 0;
				//whichLed <= 4;
			end
			else if(Led == 8'b1111) begin
				Led <= 8'b11111;//(Led << 1) | 8'b1;
				activate_sound <= 0;
				//whichLed <= 5;
			end
			else if(Led == 8'b11111) begin
				Led <= 8'b111111;//(Led << 1) | 8'b1;
				activate_sound <= 0;
				//whichLed <= 6;
			end
			else if(Led == 8'b111111) begin
				Led <= 8'b1111111;//(Led << 1) | 8'b1;
				activate_sound <= 0;
				//whichLed <= 7;
			end
			else if(Led == 8'b1111111) begin
				Led <= 8'b11111111;//(Led << 1) | 8'b1;
				activate_sound <= 1;
				//whichLed <= 0;
			end
		end
		//else begin
		//	Led <= Led;
		//end
	end
	
	assign turnOnSound = activate_sound;
	assign victory = vic;
	
	/*
	always @(posedge rst_tmp) begin
		Led <= 8'b0;
	end
		
	always @(posedge send_tmp) begin
		Led <= (Led << 1) | 8'b1;
	end
	*/
	speaker sound(.clk(clk), .rst(rst_tmp), .activate_sound(turnOnSound), .victory(victory), .sndpin(sndpin));

	clk_div dividers(.clk(clk), .rst(rst_tmp), .hz_fst(count_fst));
	
	//randomizer randomizer0(.rst(rst), .out(correct_ans));
	
	PmodKYPD keypad(.clk(clk), .row(JA[7:4]), .col(JA[3:0]), .seg(seg_tmp), .num(seg_out));//.row(JA[7:4]), .col(JA[3:0]), .seg(seg_tmp), .num(seg_out));
	wire is_correct;
	wire [3:0] num_correct;
	wire [15:0] inp = 16'b1001110111111011;
	digits dig(.my_input(inp), .defusal_code(correct_ans), .send(send_tmp), .correct(is_correct), .numCorrect(num_correct));
	wire [6:0] correct_digits;
	ssd cd(.num(num_correct), .seg(correct_digits)); 
	always @(posedge count_fst) begin
		if(whichDigit == 0) begin
			an <= 4'b0111; // update 1st digit
			seg <= 7'b1000000;//seg_out[27:21];
			whichDigit <= 1;
		end
		else if(whichDigit == 1) begin
			an <= 4'b1011; // update 2nd digit
			seg <= 7'b1000000;//seg_out[20:14];
			whichDigit <= 2;
		end // but don't blink on seconds
		else if(whichDigit == 2) begin
			an <= 4'b1101; // update 3rd digit
			seg <= 7'b1000000;//seg_out[13:7];
			whichDigit <= 3;
		end
		else begin // 3
			an <= 4'b1110; // update 4th digit
			seg <= correct_digits;//seg_out[6:0];
			whichDigit <= 0;
		end
		
		if(correct_digits == 4)
			vic <= 1;
		else
			vic <= 0;
	end
endmodule

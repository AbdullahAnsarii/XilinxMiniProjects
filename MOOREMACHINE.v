`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:48 09/08/2020 
// Design Name: 
// Module Name:    MOOREMACHINE 
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
module MOOREMACHINE(
	input [1:0] Inp, //Dime Nickel
	input reset,
	input clk,
	output [1:0] Out_state,
	output y
    );
localparam State1 = 0, State2 = 1,
			  State3 = 2, State4 = 3;

reg [1:0] state, nxtState;
reg Out;

always@(posedge clk)
begin
	if (reset) state <= State1;
	else state <= nxtState; //at positive edge it will shift to current state depending on the case
end

always@(*)
begin
	//nxtState = state;
	case (state)
	State1: begin
	if (~Inp[1] & ~Inp[0]) nxtState <= State1;
	else if (~Inp[1] & Inp[0]) nxtState <= State2;
	else if (Inp[1] & ~Inp[0]) nxtState <= State3;
	else if (Inp[1] & Inp[0]) nxtState <= State4;
	else nxtState <= State1; //for don't care case
	end
	
	State2: begin
	if (~Inp[1] & ~Inp[0]) nxtState <= State2;
	else if (~Inp[1] & Inp[0]) nxtState <= State3;
	else if (Inp[1] & ~Inp[0]) nxtState <= State4;
	else nxtState <= State2; //for don't care case
	end
	
	State3: begin
	if (~Inp[1] & ~Inp[0]) nxtState <= State3;
	else if (~Inp[1] & Inp[0]) nxtState <= State4;
	else nxtState <= State3; //for don't care case
	end
	
	State4: begin
	nxtState <= State1;
	end
	default: begin
	end
	endcase
end

always@(*)
begin
Out <= 0;
	case(state)
	State1: Out <= 0;
	State2: Out <= 0;
	State3: Out <= 0;
	State4: Out <= 1;
	default: Out <= 0;
	endcase
end

assign y = Out;
assign Out_state = state; 
endmodule

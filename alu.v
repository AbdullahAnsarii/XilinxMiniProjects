`timescale 1ns / 1ps

module alu(
	input [7:0] a, b,
	input [2:0] op,
	output reg [7:0] x,
	output reg [3:0] flag
   );
	
	always @(a,b,op) begin
		case(op)
			3'b000: begin
				{flag[1], x} = a + b;
				flag[0] =  x[7];
				flag[2] = (x == 0) ? 1'b1 : 1'b0;
				flag[3] = (a[7] == b[7]) && (a[7] != x[7]) ? 1'b1 : 1'b0;
			end
			
			3'b001: begin
				{flag[1], x} = a - b;
				flag[0] =  x[7];
				flag[2] = (x == 0) ? 1'b1 : 1'b0;
				flag[3] = (a[7] == ~b[7]) && (a[7] != x[7]) ? 1'b1 : 1'b0;
			end
			
			3'b010: begin
				x = a & b;
				flag[0] =  x[7];
				flag[1] =  0;
				flag[2] = (x == 0) ? 1'b1 : 1'b0;
				flag[3] =  0;
			end
			
			3'b011: begin
				x = a | b;
				flag[0] =  x[7];
				flag[1] =  0;
				flag[2] = (x == 0) ? 1'b1 : 1'b0;
				flag[3] =  0;
			end
			
			3'b100: begin
				x = a ^ b;
				flag[0] =  x[7];
				flag[1] =  0;
				flag[2] = (x == 0) ? 1'b1 : 1'b0;
				flag[3] =  0;
			end
			
			3'b101: begin
				x = ~a;
				flag[0] =  x[7];
				flag[1] =  0;
				flag[2] = (x == 0) ? 1'b1 : 1'b0;
				flag[3] =  0;
			end
			
			3'b110: begin
				{flag[1], x} = a << 1;
				flag[0] =  x[7];
				flag[1] =  0;
				flag[2] = (x == 0) ? 1'b1 : 1'b0;
				flag[3] =  0;
			end
			
			3'b111: begin
				{flag[1], x} = a >> 1;
				flag[0] =  x[7];
				flag[1] =  0;
				flag[2] = (x == 0) ? 1'b1 : 1'b0;
				flag[3] =  0;
			end
			
			default:
				{flag, x} = 0;
				
		endcase
	end
endmodule

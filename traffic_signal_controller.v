`timescale 1ns / 1ps

module traffic_signal_controller(clk, x, reset, hwy, cntry);
	 
	input clk, reset, x;
	parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;
	parameter green = 2'b00, red = 2'b01, yellow = 2'b10;
	reg [2:0] state, next_state;
	output reg [1:0] hwy, cntry;
	
	initial begin 
		state = s0; 
		next_state = s0; 
		hwy = green; 
		cntry = red; 
	end 
	
	always @(posedge clk) begin
		if(reset)
			state <= s0; 
		else
			state <= next_state;
	end

	always @(state or x) begin
		case(state)
			s0: begin
					hwy = green;
					cntry	= red;
					next_state = x ? s1: s0; 
				 end

			s1: begin
					hwy = yellow;
					cntry	= red;
					next_state = s2; 
				 end

			s2: begin
					hwy = red;
					cntry	= red;
					next_state = s3; 
				 end
			
			s3: begin
					hwy = red;
					cntry	= green;
					next_state = x ? s3: s4; 
				 end
			
			s4: begin
					hwy = red;
					cntry	= yellow;
					next_state = s0; 
				 end
			
			default: begin
							next_state = s0;
							hwy = green; 
							cntry = red; 
						end 
		endcase
	end
	
endmodule

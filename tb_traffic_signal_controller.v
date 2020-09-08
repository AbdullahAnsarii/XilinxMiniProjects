`timescale 1ns / 1ps

module tb_traffic_signal_controller;

	// Inputs
	reg clk;
	reg x;
	reg reset;

	// Outputs
	wire [1:0] hwy;
	wire [1:0] cntry;

	// Instantiate the Unit Under Test (UUT)
	traffic_signal_controller uut (
		.clk(clk), 
		.x(x), 
		.reset(reset), 
		.hwy(hwy), 
		.cntry(cntry)
	);
	
	always
	#5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		x = 0; reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10; x=0;
		#10; x=0;
		#10; x=1;
		#10; x=0;
		#10; x=0;
		#10; x=1;
		#10; x=1;
		#10; reset=1;
	end
	
endmodule


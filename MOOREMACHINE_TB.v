`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:13:48 09/08/2020
// Design Name:   MOOREMACHINE
// Module Name:   C:/Users/Abdullah/Desktop/DRSaadVIVA/MOORE/MOOREMACHINE_TB.v
// Project Name:  MOORE
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MOOREMACHINE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MOOREMACHINE_TB;

	// Inputs
	reg [1:0] Inp;
	reg reset;
	reg clk;

	// Outputs
	wire [1:0] Out_state;
	wire y;

	// Instantiate the Unit Under Test (UUT)
	MOOREMACHINE uut (
		.Inp(Inp), 
		.reset(reset), 
		.clk(clk), 
		.Out_state(Out_state), 
		.y(y)
	);
	always
		#5 clk = ~clk;

	initial begin
		// Initialize Inputs
		Inp = 0;
		reset = 1;
		clk = 0;
		#20
		
		#20
		Inp = 1;
		reset = 0;
		
		#20
		Inp = 1;
		reset = 0;
		
		#20
		Inp = 1;
		reset = 0;
		
		#20
		Inp = 1;
		reset = 0;
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


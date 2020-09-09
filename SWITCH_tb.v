`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:31:16 09/08/2020
// Design Name:   SWITCH
// Module Name:   C:/Users/Abdullah/Desktop/Labs/SWITCH/SWITCH_tb.v
// Project Name:  SWITCH
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SWITCH
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SWITCH_tb;

	// Inputs
	reg x1;
	reg x2;
	reg x3;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	SWITCH uut (
		.x1(x1), 
		.x2(x2), 
		.x3(x3), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		x1 = 0;
		x2 = 0;
		x3 = 0;
		#20
		
		x1 = 0;
		x2 = 0;
		x3 = 1;
		#20
		
		x1 = 0;
		x2 = 1;
		x3 = 0;
		#20
		
		x1 = 0;
		x2 = 1;
		x3 = 1;
		#20
		
		x1 = 1;
		x2 = 0;
		x3 = 0;
		#20
		
		x1 = 1;
		x2 = 0;
		x3 = 1;
		#20
		
		x1 = 1;
		x2 = 1;
		x3 = 0;
		#20
		
		x1 = 1;
		x2 = 1;
		x3 = 1;
		#20

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


`timescale 1ns / 1ps

module tb_alu;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg [2:0] op;

	// Outputs
	wire [7:0] x;
	wire [3:0] flag;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.a(a), 
		.b(b), 
		.op(op), 
		.x(x), 
		.flag(flag)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		op = 0;

		
		// Add stimulus here
		#10;
		a = 3;		b = 2; 	op = 0;
		#10;
		a = 64; 	b = 64; 		op = 0;
		#10;
		a = 2; 		b = 2;		op = 1;
		#10;
		a = -126; b = -3; 	op = 1;
		#10;
		a = 64; 	b = 64; 	op = 2;
		#10;
		a = 64; 	b = 64; 	op = 3;
		#10;
		a = 64; 	b = 64; 	op = 4;
		#10;
		a = 64; 	b = 64; 	op = 5;
		#10;
		a = 64; 	b = 64; 	op = 6;
		#10;
		a = 64; 	b = 64; 	op = 7;
		// Wait 100 ns for global reset to finish
		#100;
        
	
	end
      
endmodule


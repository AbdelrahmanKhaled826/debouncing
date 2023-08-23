`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:41:25 08/23/2023
// Design Name:   top_module
// Module Name:   C:/example_verilog/d_ff/debounce_tb.v
// Project Name:  debounce
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module debounce_tb;

	// Inputs
	reg clk;
	reg reset;
	reg noisy;

	// Outputs
	wire debounced;

	// Instantiate the Unit Under Test (UUT)
	top_module uut (
		.clk(clk), 
		.reset(reset), 
		.noisy(noisy), 
		.debounced(debounced)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		noisy = 0;
		#10000
		reset=0;
	end
initial 
begin
	#10000
	display();
	#10000
	display();
	#10000
	display();
	#10000
	display();
	#10000
	$stop;
end
	
always #5 clk=~clk;  


task display();
integer i=0;
	for (i=0;i<=100;i=i+10)begin
		#i
		noisy=~noisy;
	end
endtask

endmodule


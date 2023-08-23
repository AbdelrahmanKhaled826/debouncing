`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:09:30 08/23/2023 
// Design Name: 
// Module Name:    debounce_controlpath 
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
module debounce_controlpath(
input clk,reset,
input noisy,
input timer_done,
output debounced,
output timer_reset
    );

reg [1:0] current_state,next_state;
parameter   s0=0,
		s1=1,
		s2=2,
		s3=3;
		
//current state

always @(posedge clk,posedge  reset)
begin
	if(reset)
		current_state<=s0;
	else
		current_state<=next_state;
end		

// fsm

always @(*)
begin
	next_state=current_state;
	case(current_state)
		s0:	if(~noisy) 
				next_state=s0;
			else if(noisy)
				next_state=s1;
		
		s1:	if(~noisy) 
				next_state=s0;
			else if(noisy & ~timer_done)
				next_state=s1;
				//timer_reset=0;
			else
				next_state=s2;
		s2:	if(~noisy) 
				next_state=s3;
			else if(noisy )
				next_state=s2;
				//debounced=1;
				//clear_timer
		s3:	if(noisy) 
				next_state=s2;
			else if(~noisy & ~timer_done)
				next_state=s3;
			else if(~noisy & timer_done)
				next_state=s0;
		default: next_state=s0;		
	endcase
end

// output logic 
assign timer_reset=(current_state ==s0)|(current_state ==s2);
assign debounced=(current_state ==s2)|(current_state ==s3) ;


endmodule

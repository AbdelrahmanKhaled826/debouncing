`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:07:26 08/23/2023 
// Design Name: 
// Module Name:    top_module 
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
module top_module(
input clk,
input reset,
input noisy,
output debounced
    );
wire timer_done,timer_reset;



debounce_controlpath FSM(
.clk(clk),
.reset(reset),
.noisy(noisy),
.timer_done(timer_done),
.timer_reset(timer_reset),
.debounced(debounced)
);


timer_dp datapath(
.clk(clk),
.reset(timer_reset),
.done(timer_done)
);

endmodule

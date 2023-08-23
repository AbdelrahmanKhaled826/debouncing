`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:10:10 08/23/2023 
// Design Name: 
// Module Name:    timer_dp 
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
module timer_dp
#(parameter VALUE=20
)
(
input clk,reset,
output  done
    );


reg [5:0] q;
always @(posedge clk)begin
	if(reset | q==VALUE) 
		q<=0;
	else 	
		q<=q+1;
end

assign done=(q==VALUE)? 1'b1:1'b0;



endmodule

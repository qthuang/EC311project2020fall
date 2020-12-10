`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2020 09:11:05 PM
// Design Name: 
// Module Name: Start
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Start(rst, start, difi, mul);
input rst, start;
input [1:0] difi;
output [1:0] mul;

wire [1:0] indi;


assign indi[0] = rst;
assign indi[1] = start;

assign mul = (indi == 2'b10) ? difi : 0;



endmodule

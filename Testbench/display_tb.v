`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 02:42:11 PM
// Design Name: 
// Module Name: display_tb
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


module display_tb();

reg clk;
reg rst;

reg  [1:0]sec0;
wire [7:0]sel;
wire [6:0]data;

initial begin
	rst = 1;
	clk = 0;
	#10
	rst = 0;
	#10
	sec0=1;
	#10
	sec0=2;
	#10
	sec0=2;
end
always #10 clk =~clk;
//always #10 rst_n =~rst_n;

displaydiff D1(
clk,sec0,data,sel);


endmodule

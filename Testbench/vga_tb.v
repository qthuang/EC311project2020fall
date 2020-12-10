`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 04:32:20 PM
// Design Name: 
// Module Name: vga_tb
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

`timescale 1ns/1ns
module tb_vga();
reg clk;
reg rst_n;

wire H_sync;
wire V_sync;
wire [2:0]r;
wire [2:0]g;
wire [1:0]b;
wire [9:0]hcount;
wire [9:0]vcount;

initial begin
	rst_n = 1;
	clk = 0;
	#10
	rst_n = 0;
end
always #10 clk =~clk;
//always #10 rst_n =~rst_n;

vga vga_inst(
	.clk(clk),//50M??
	.rst(rst_n),
	.r(r),
	.g(g),
	.b(b),
	.hs(H_sync),
	.vs(V_sync),
	.hcount(hcount),
	.vcount(vcount)
	//.rgb_data(rgb_data)
);
endmodule
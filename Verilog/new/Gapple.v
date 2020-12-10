`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 02:51:59 PM
// Design Name: 
// Module Name: Gapple
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


module Gapple(refle, start, rand, rst, clk_1hz, Hl, Hr, Vu, Vd);
input refle, rst, clk_1hz, start;
input [7:0] rand;
output reg [9:0] Vu, Vd, Hl, Hr;
//reg [7:0] randi = 10;

always @(refle or rst or start or rand)begin
    if (refle == 1 || rst == 1 || start == 0)begin
        Vu = 0;
        Vd = 0;
        Hl = 0;
        Hr = 0; end
        //randi <= rand; end
    else begin
        Vu = rand + 60;
        Vd = Vu + 15;
        Hl = (rand*2)+170;
        Hr = Hl + 15; end
end
        
endmodule

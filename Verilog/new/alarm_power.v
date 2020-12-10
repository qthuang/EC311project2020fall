`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/29 12:06:10
// Design Name: 
// Module Name: alarm_power
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


module alarm_power(clk,res,power,finalres);
input clk;
input res;
input power;
output reg finalres;


always @ (clk)
begin
if(power)
finalres<=res;
else
finalres<=0;
end

endmodule

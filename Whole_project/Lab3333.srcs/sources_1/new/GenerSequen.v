`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 08:24:39 PM
// Design Name: 
// Module Name: GenerSequen
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


module GenerSequen(sequen, led, transpush, clk_1HZ, rst);

input transpush, clk_1HZ, rst;
output reg [1:0] sequen;
output reg [6:0] led;

 always @(posedge clk_1HZ or negedge rst) begin
    if (rst == 1) begin
          sequen <= 1;
          led <= 7'b0000001;end
          else if (sequen == 1 && transpush == 1)begin
            sequen <= 2;
            led <= 7'b0000010; end
          else if (sequen == 2 && transpush == 1)begin
            sequen <= 3;
            led <= 7'b0000100; end
          else if (sequen == 3 && transpush == 1)begin
            sequen <= 1;
            led <= 7'b0000001; end
          else
            sequen <= sequen;
 end
           
endmodule

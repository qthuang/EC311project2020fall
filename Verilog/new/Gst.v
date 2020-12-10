`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2020 09:24:43 PM
// Design Name: 
// Module Name: Gst
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


module Gst(sequen, led, transpush, clk_1HZ, rst);

input transpush, clk_1HZ, rst;
output reg sequen;
output reg led;

 always @(posedge clk_1HZ or negedge rst) begin
    if (rst == 1) begin
          sequen <= 0;
          led <= 0;end
          else if (sequen == 0 && transpush == 1)begin
            sequen <= 1;
            led <= 1; end
          else if (sequen == 1 && transpush == 1)begin
            sequen <= 0;
            led <= 0; end
          else
            sequen <= sequen;
 end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 02:09:34 PM
// Design Name: 
// Module Name: Random_nanchara
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


module Random_nanchara(sec, rst, clk_1hz, rand);
input rst, clk_1hz;
input [7:0] sec;
output reg [7:0] rand;
reg [2:0] indi;

always @(posedge clk_1hz) begin
    if (rst) begin
        indi <= 0;
        rand <= 0; end
     else begin
        if (sec <= 5)
            indi <= 1;
            else if (sec <= 10 && sec > 5)
                indi <= 2;
            else if (sec <= 15 && sec > 10)
                indi <= 3;
            else if (sec <= 20 && sec > 15)
                indi <= 4;
            else if (sec <= 25 && sec > 20)
                indi <= 5;
            else if (sec <= 30 && sec > 25)
                indi <= 6;
      end
      
      if (indi == 1) 
        rand <= sec * 40;
      else if (indi == 2) 
        rand <= sec * 25;
      else if (indi == 3)
        rand <= sec * 15;
      else if (indi == 4) 
        rand <= sec * 4;
      else if (indi == 5)
        rand <= sec * 3;
      else if (indi == 6)
        rand <= sec * 5;
      else if (indi == 0)
        rand <= 0;
      else
        rand <= rand;
 
 end


endmodule

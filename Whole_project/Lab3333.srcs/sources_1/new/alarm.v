`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2020 07:41:26 PM
// Design Name: 
// Module Name: alarm
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


module alarm(
    input [3:0]H1, H2, M1, M2, S1, S2,
    input [3:0]H1_i, H2_i, M1_i, M2_i, S1_i, S2_i,
    input clk,
    input reset_button,
    output res
    );
    reg res_w;
    reg D;
    
    always @(posedge clk) begin
    if (H1==H1_i && H2==H2_i && M1==M1_i && M2==M2_i && S1==S1_i && S2==S2_i)
     D = 1;
    if (reset_button==1)
     D = 0;
    end
    
    always @(posedge clk) 
    begin
     if(reset_button==1'b1)
      res_w <= 1'b0; 
     else 
      res_w <= D; 
    end 
    
    
    
     assign res = res_w;
    
endmodule


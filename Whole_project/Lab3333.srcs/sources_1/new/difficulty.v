`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2020 04:53:12 PM
// Design Name: 
// Module Name: difficulty
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


module difficulty(
    input button,
    input clk_1hz,
    input reset,
    output reg [2:0]dif,
    output reg [4:0] led
    );
    
    always @ (posedge clk_1hz) begin
        if(reset) begin
            dif <= 1;
            led <= 5'b00001; end
        else if(dif == 0 && button == 1) begin
            dif <= 2;
            led <= 5'b00010; end
        else if(dif == 2 && button == 1) begin
            dif <= 3;
            led <= 5'b00100; end
        else if(dif == 3 && button == 1) begin
            dif <= 4;
            led <= 5'b01000; end        
        else if(dif == 4 && button == 1) begin
            dif <= 5;
            led <= 5'b10000;end
        else if(dif == 5 && button == 1)begin
            dif <= 1;
            led <= 5'b00001;end
            
        else
            dif <= dif;
    end
        
endmodule

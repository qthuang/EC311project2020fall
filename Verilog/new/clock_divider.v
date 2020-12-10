`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2020 02:51:01 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider #(
    parameter div_value = 1) 
    (input wire clk,
    output reg divided_clk = 0);
    
    integer counter_value = 0;
    always@ (posedge clk) begin
        if (counter_value == div_value)
            counter_value <= 0;
        else
            counter_value <= counter_value + 1;
    end
    
    always@ (posedge clk) begin
        if (counter_value == div_value)
            divided_clk <= ~divided_clk;
        else
            divided_clk <= divided_clk;
    end
endmodule
    
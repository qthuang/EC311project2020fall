`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/13 22:52:31
// Design Name: 
// Module Name: full_adder_newrca
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


module full_adder_newrca(
   input a, 
    input b, 
    input c_in, 
    output sum, 
    output c_out
    );     
    
    wire temp1, temp2, temp3;
    
    half_adder_newrca ha1(.a(a), .b(b), .sum(temp1), .c_out(temp2));
    half_adder_newrca ha2(.a(c_in), .b(temp1), .sum(sum), .c_out(temp3));
    
    or or1(c_out, temp2, temp3);
endmodule


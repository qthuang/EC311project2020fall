`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module Combine(
    input rst_n,
    input reset,
    input CLK,
    input PS2_CLK, 
    input PS2_DATA,
    input button,
    input startpush, 
    output  [2:0] r,  
    output  [2:0] g,  
    output  [1:0] b,  
    output hs,  
    output vs,
    output [6:0] led,
    output leddd,
    output reg finish,
    output reg [6:0]  dataf,
    output reg [7:0]  self
    );
    wire [1:0] difi, mul;
    wire clk_1hz;
    wire start;
    wire [7:0] sel;
    wire [6:0] data;
    wire [7:0] sel2, eat;
    wire [6:0] data2;
    wire finish2;
    wire timeup;
    CLK1HZ DV(CLK, clk_1hz);
    GenerSequen S1 (difi, led, button, clk_1hz, reset);
    Gst S2 (start, leddd, startpush, clk_1hz, reset);
    Start S3 (reset, start, difi, mul);
    //Random_nanchara R1 (sec, reset, clk_1hz, rand);
    //Gapple G1 (refle, start, rand, reset, clk_1hz, Hl, Hr, Vu, Vd);
    vga V2(timeup,mul, CLK, reset, PS2_CLK, PS2_DATA, hs, vs, r, g, b, finish2, eat);
    displaydiff D1(CLK,difi,sel,data);
    top T1(
        .clk(CLK),
        .rst_n(rst_n),
        .sel(sel2),
        .data(data2),
        .reset_button(reset),
        .start(start),
        .finish(finish2),
        .eat(eat),
        .timeup(timeup)
    );
    
    always@(*) begin
    finish<=finish2;
    end
    
    
    always@(start)begin
    if(start)begin
    self<=sel2;
    dataf<=data2;
    end
    else begin
    self<=sel;
    dataf<=data;
    end
    end
endmodule

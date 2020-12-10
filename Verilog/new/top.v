`timescale 1ns / 1ps
module top(clk,rst_n,sel,data,reset_button,start,finish, eat, timeup
    );
input         clk,rst_n,reset_button, start,finish;
input   [7:0] eat;
output  [7:0] sel;
output  [6:0] data;
output timeup;
wire          res;
wire    [2:0] mode;
wire    [7:0] sec,min,hour,asec,amin,ahour;
wire    [3:0] one1,ten1,one2,ten2,one3,ten3,one11,ten11,one22,ten22,one33,ten33;
wire          finalres;
clock1     clock(
//  .button_mode(button_mode),
//  .button_in(button_in),
//  .button_in2(button_in2),    
                 .clk(clk),
 .rst_n(reset_button),
 .sec(sec),
 .asec(asec),
 .amin(amin),
 .ahour(ahour), 
 .min(min),
 .hour(hour),
 .start(start),
 .finish(finish),
 .timeup(timeup)
 );  


bin_dec1    bin_dec1(
                 .clk(clk),
 .rst_n(rst_n),
 .bin(sec),
 .one(one1),
 .ten(ten1)
 );
 
bin_dec1    bin_dec2(
                 .clk(clk),
 .rst_n(rst_n),
 .bin(min),
 .one(one2),
 .ten(ten2)
 );
 
bin_dec1    bin_dec3(
                 .clk(clk),
 .rst_n(rst_n),
 .bin(eat),
 .one(one3),
 .ten(ten3)
 );
 
led    led(
 .mode(3'b000),
 .twelve(1'b0),
 .clk(clk),
 .sec0(one1),
 .sec1(ten1),
 .min0(one2),
 .min1(ten2),
 .hour0(one3),
 .hour1(ten3),
 .asec0(one11),
 .asec1(ten11),
 .amin0(one22),
 .amin1(ten22),
 .ahour0(one33),
 .ahour1(ten33),
 .data(data),
 .sel(sel)
 );
 
 alarm  alarm(
 .H1(one3),
 .H2(ten3),
 .M1(one2),
 .M2(ten2),
 .S1(one1),
 .S2(ten1),
 .H1_i(one33),
 .H2_i(ten33),
 .M1_i(one22),
 .M2_i(ten22),
 .S1_i(one11),
 .S2_i(ten11),
 .reset_button(reset_button),
 .res(res),
 .clk(clk)
 );
 
 alarm_power ap(
 .clk(clk),
 .res(res),
 .finalres(finalres),
 .power(1'b1)
 );
 
 bin_dec1    bin_dec4(
                 .clk(clk),
 .rst_n(rst_n),
 .bin(asec),
 .one(one11),
 .ten(ten11)
 );
 
bin_dec1    bin_dec5(
                 .clk(clk),
 .rst_n(rst_n),
 .bin(amin),
 .one(one22),
 .ten(ten22)
 );
 
bin_dec1    bin_dec6(
                 .clk(clk),
 .rst_n(rst_n),
 .bin(ahour),
 .one(one33),
 .ten(ten33)
 );

endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2020 04:37:10 PM
// Design Name: 
// Module Name: clock1
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


module clock1(sec,min,asec,amin,hour,ahour,clk,rst_n, start,finish, timeup
    );
//input         button_mode;
//input         button_in;
//input         button_in2;
input         clk,rst_n, start,finish;
output [7:0]  sec,min,asec,amin;
output [7:0]  hour,ahour;
output reg timeup;
//output [2:0]  mode;
reg    [7:0]  sec,asec;
reg    [7:0]  min,amin;
reg    [7:0]  hour,ahour;
reg           clk_div;
reg    [32:0] cnt;
//reg    [2:0]  mode;

initial begin
//mode=0;
asec=0;
sec=30;
amin=0;
min=0;
hour=0;
ahour=0;
end
 //????  50MHz - 1Hz
always @ ( posedge clk or negedge rst_n)
begin
    if(rst_n)
    begin
    cnt <= 0;
 clk_div <= 0;
    end
   else begin
if ( cnt < 50000000 - 1 )
   begin
   clk_div <= 0;
   cnt <= cnt + 1;
   end
else if ( cnt < 100000000 - 1 )
   begin
   clk_div <= 1;
   cnt <= cnt + 1 ;
       end
    else
       cnt <=0 ;
end
end
// ????
always @ ( posedge clk_div or negedge rst_n )
begin
   if(rst_n)
    sec <= 30;
  else begin
    if (sec == 0 || start == 0||finish==1)
        sec <= sec;
    else
        sec <= sec - 1;
    end
end

always @ (posedge clk_div or negedge rst_n) begin
    if(rst_n)
        timeup <= 0;
    else if(sec == 0)
        timeup <= 1;
    else
        timeup <= timeup;
end


//always @ ( posedge clk_div or negedge rst_n)
//begin
//   if(!rst_n)
//    min <= 0;
//   else begin
//   if(mode==2)
//    begin
//    if (min ==59&&button_in==1 )
//      min <= 0;
//    else if(button_in==1)
//      min <= min + 1 ;
//    end
// if ( sec == 59 )
// begin
// if (min ==59 )
// min <= 0;
// else
// min <= min + 1 ;
// end
//     end
//end

//always @ ( posedge clk_div or negedge rst_n)
//begin
//   if(!rst_n)
//    hour <= 0;
//  else begin
//  if(mode==1)
//    begin
//    if(hour==23&&button_in==1)
//    hour<=0;
//    else if(button_in==1)
//    hour<=hour+1;
//  end
//if ( sec == 59 && min ==59 )
//begin
//if (hour == 23)
//hour <= 0 ;
//else
//hour <= hour + 1;
//end
//end
//end

//always @ ( posedge clk_div or negedge rst_n)
//begin
//   if (!rst_n)
//    mode<=0;
//   else if(mode==0 && button_mode==1)
//   begin
//   mode<=1;
//   end
//   else if(mode==1 && button_mode==1)
//   begin
//   mode<=2;
//   end
//   else if(mode==2 && button_mode==1)
//   begin
//   mode<=3;
//   end
//   else if(mode==3 && button_mode==1)
//   begin
//   mode<=4;
//   end
//   else if(mode==4 && button_mode==1)
//   begin
//   mode<=5;
//   end
//   else if(mode==5 && button_mode==1)
//   begin
//   mode<=6;
//   end
//   else if(mode==6 && button_mode==1)
//   begin
//   mode<=0;
//   end
//   else
//   mode<=mode;
//end

//always @ ( posedge clk_div or negedge rst_n)
//begin
//   if (!rst_n)
//    begin
//    asec<=0;
//    amin<=0;
//    ahour<=0;
//    end
//    else begin
//   if(mode==4)
//   begin
//   if(ahour==23&&button_in2==1)
//    ahour<=0;
//    else if(button_in2==1)
//    ahour<=ahour+1;
//   end
//   else if(mode==5)
//   begin
//   if(amin==59&&button_in2==1)
//    amin<=0;
//    else if(button_in2==1)
//    amin<=amin+1;
//   end
//    else if(mode==6)
//   begin
//   if(asec==59&&button_in2==1)
//    asec<=0;
//    else if(button_in2==1)
//    asec<=asec+1;
//   end
//   else
//   begin
//   asec<=asec;
//   amin<=amin;
//   ahour<=ahour;
//   end
//   end
//end

endmodule
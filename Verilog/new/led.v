`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2020 05:00:57 PM
// Design Name: 
// Module Name: led
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


module led(mode,twelve,clk,sec0,sec1,min0,min1,hour0,hour1,asec0,asec1,amin0,amin1,ahour0,ahour1,sel,data
    );
input      [2:0]  mode;
input             twelve;
input             clk;
input      [3:0]  sec0,sec1,min0,min1,hour0,hour1,asec0,asec1,amin0,amin1,ahour0,ahour1;
output reg [6:0]  data;
output reg [7:0]  sel;
       reg [3:0]  data_dis=0;
reg [20:0] m=0;

 
always @ ( posedge clk )
begin
    m<=m+1;
end  


always@( posedge clk) 
 begin
 case(m[16:14])
   0: begin
  data_dis<=4'b1100;
sel<=8'b1111_1110;
  end
1: begin
  if(mode==0&&twelve==1&&hour1>=1&&hour0>2)begin
  data_dis<=4'b1011;
  sel<=8'b1111_1101;
  end
  else if(mode==0&&twelve==1)
  begin
  data_dis<=4'b1010;
  sel<=8'b1111_1101;
  end
  else 
  begin
  data_dis<=4'b1100;
  sel<=8'b1111_1101;
  end
end
2: begin
if(mode==0&&twelve==1&&hour1>=1&&hour0>2)
begin
  data_dis<=4'b0000;
sel<=8'b1111_1011;
 end
 else if(mode==0)
 begin
    data_dis<=hour1;
sel<=8'b1111_1011;
 end
 else
 begin
 data_dis<=4'b1100;
sel<=8'b1111_1011;
end
  end
  
3: begin
if(mode==0&&twelve==1&&hour1>=1&&hour0>2)
begin
  data_dis<=hour0-4'b0010;
sel<=8'b1111_0111;
 end
 else if (mode==0)
 begin
  data_dis<=hour0;
sel<=8'b1111_0111;
 end
 else
 begin
 data_dis<=4'b1100;
sel<=8'b1111_0111;
end
  end
4: begin
  if(mode==0)
  begin
  data_dis<=min1;
  sel<=8'b1110_1111;
  end
  else
 begin
 data_dis<=4'b1101;
sel<=8'b1110_1111;
end
    end
5: begin
  if(mode==0)
  begin
  data_dis<=min0;
sel<=8'b1101_1111;
  end
  else if(mode==4 || mode==5 || mode==6)
  begin
  data_dis<=4'b1010;
  sel<=8'b1101_1111;
  end
  else
  begin
  data_dis<=4'b1100;
  sel<=8'b1101_1111;
  end
end
6: begin
  if(mode==0)
  begin
  data_dis<=sec1;
sel<=8'b1011_1111;
  end
  else if(mode==1)
  begin
  data_dis<=hour1;
  sel<=8'b1011_1111;
  end
  else if(mode==2)
  begin
  data_dis<=min1;
  sel<=8'b1011_1111;
  end
  else if(mode==3)
  begin
  data_dis<=sec1;
  sel<=8'b1011_1111;
  end  
  else if(mode==4)
  begin
  data_dis<=ahour1;
  sel<=8'b1011_1111;
  end 
  
  else if(mode==5)
  begin
  data_dis<=amin1;
  sel<=8'b1011_1111;
  end 
  else if(mode==6)
  begin
  data_dis<=asec1;
  sel<=8'b1011_1111;
  end 
  
  
  end
7: begin
  if(mode==0)
  begin
  data_dis<=sec0;
sel<=8'b0111_1111;
  end
    else if(mode==1)
  begin
  data_dis<=hour0;
  sel<=8'b0111_1111;
  end
  else if(mode==2)
  begin
  data_dis<=min0;
  sel<=8'b0111_1111;
  end
  else if(mode==3)
  begin
  data_dis<=sec0;
  sel<=8'b0111_1111;
  end 
  
  else if(mode==4)
  begin
  data_dis<=ahour0;
  sel<=8'b0111_1111;
  end 
  
  else if(mode==5)
  begin
  data_dis<=amin0;
  sel<=8'b0111_1111;
  end 
  else if(mode==6)
  begin
  data_dis<=asec0;
  sel<=8'b0111_1111;
  end 
  
  
end
default:begin
  data<=8'bz;
sel<=8'bz;
end 
endcase 

end


always @(data_dis)
begin
case(data_dis)//????
4'b0000:data = 7'b1000000;//??0
4'b0001:data = 7'b1111001;//??1
4'b0010:data = 7'b0100100;//??2
4'b0011:data = 7'b0110000;//??3
4'b0100:data = 7'b0011001;//??4
4'b0101:data = 7'b0010010;//??5
4'b0110:data = 7'b0000010;//??6
4'b0111:data = 7'b1111000;//??7
4'b1000:data = 7'h0000000;//??8
4'b1001:data = 7'b0010000;//??9
4'b1010:data = 7'b0001000;//A
4'b1011:data = 7'b0001100;//P
4'b1100:data = 7'b1111111;
4'b1101:data = 7'b0010010;//S
default data = 8'hxx;
endcase
end

endmodule

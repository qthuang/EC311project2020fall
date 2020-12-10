`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 02:19:22 PM
// Design Name: 
// Module Name: displaydiff
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


module displaydiff(clk,sec0,sel,data
    );
input             clk;
input      [1:0]  sec0;
output reg [6:0]  data;
output reg [7:0]  sel;
       reg [3:0]  data_dis=0;


always@( posedge clk) 
 begin
 case(sec0)
   0: begin
  data_dis<=4'b0000;
sel<=8'b0111_1111;
  end
1: begin
  data_dis<=4'b0001;
sel<=8'b0111_1111;
end
2: begin
  data_dis<=4'b0010;
sel<=8'b0111_1111;
  end
3: begin
  data_dis<=4'b0011;
sel<=8'b0111_1111;
  end
default:begin
 data_dis<=4'b0000;
sel<=8'b0111_1111;
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
default data = 8'hxx;
endcase
end

endmodule
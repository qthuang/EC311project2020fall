`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2020 04:38:36 PM
// Design Name: 
// Module Name: bin_dec1
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

module bin_dec1(clk,bin,rst_n,one,ten,hun
    );
input  [7:0] bin;
input        clk,rst_n;
output [3:0] one,ten;
output [1:0] hun;
reg    [3:0] one,ten;
reg    [1:0] hun;
reg    [3:0] count;
reg    [17:0]shift_reg=18'b000000000000000000;
always @(posedge clk or negedge rst_n)
begin
if( !rst_n ) 
   count<=0;
 else if (count==9)
   count<=0;
 else
   count<=count+1;
end
always @ (posedge clk or negedge rst_n )
begin
  if (!rst_n)
       shift_reg=0;
  else if (count==0)
       shift_reg={10'b0000000000,bin};
  else if ( count<=8)                //??8?????
   begin
      if(shift_reg[11:8]>=5)         //??????>5?????+3  
          begin
             if(shift_reg[15:12]>=5) //??????>5?????+3  
                 begin
   shift_reg[15:12]=shift_reg[15:12]+2'b11;   
   shift_reg[11:8]=shift_reg[11:8]+2'b11;
shift_reg=shift_reg<<1;  //????????????????
 end
             else
       begin
                   shift_reg[15:12]=shift_reg[15:12];
shift_reg[11:8]=shift_reg[11:8]+2'b11;
shift_reg=shift_reg<<1;
 end
          end  
             
      else
          begin
             if(shift_reg[15:12]>=5)
                 begin
   shift_reg[15:12]=shift_reg[15:12]+2'b11;
   shift_reg[11:8]=shift_reg[11:8];
shift_reg=shift_reg<<1;
 end
             else
       begin
                   shift_reg[15:12]=shift_reg[15:12];
shift_reg[11:8]=shift_reg[11:8];
shift_reg=shift_reg<<1;
 end
          end  
      
  end
  end
  always @ ( posedge clk or negedge rst_n )
begin
 if ( !rst_n )
  begin
    one<=0;
    ten<=0;
    hun<=0; 
  end
  else if(count==9)
  begin
    one<=shift_reg[11:8];
    ten<=shift_reg[15:12];
    //hun<=shift_reg[17:16];
  end
  end
endmodule
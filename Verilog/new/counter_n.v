`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 10:43:41 AM
// Design Name: 
// Module Name: counter_n
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


module counter_n(
input   clk, n_reset, button_in,        // inputs
//output [7:0]anode,
//    output reg [6:0]seg_data
output [3:0]result
      
    );
     reg DB_out;
      reg [3:0] counter;

      reg [3:0] counter_reg;

    parameter N = 11 ;      
  
    reg  [N-1 : 0]  delaycount_reg;                     
    reg  [N-1 : 0]  delaycount_next;
      
    reg DFF1, DFF2;                                 
    wire q_add;                                     
    wire q_reset;
  
 
 reg  delay_reg ;
 wire level_out;
  
        always @ ( posedge clk or negedge n_reset )
        begin
            if(n_reset ==  0)
                begin
                    DFF1 <= 1'b0;
                    DFF2 <= 1'b0;
                    delay_reg  <=  1'b0;
 
                    delaycount_reg <= { N {1'b0} };
                end
            else
                begin
                    DFF1 <= button_in;
                    DFF2 <= DFF1;
                    delaycount_reg <= delaycount_next;
                         
                     
                     
                    delay_reg  <=  DB_out;
                end
        end
      
      
    assign q_reset = (DFF1  ^ DFF2); 
                                       
    assign  q_add = ~(delaycount_reg[N-1]);        
      
  
    always @ ( q_reset, q_add, delaycount_reg)
        begin
            case( {q_reset , q_add})
                2'b00 :
                        delaycount_next <= delaycount_reg;
                2'b01 :
                        delaycount_next <= delaycount_reg + 1;
                default :
                        delaycount_next <= { N {1'b0} };
            endcase   
        end
      
      
    always @ ( posedge clk )
        begin
            if(delaycount_reg[N-1] == 1'b1)
                    DB_out <= DFF2;
            else
                    DB_out <= DB_out;
        end
          
     
    assign  level_out  =  (delay_reg)  &  (~DB_out);     
    
              
 
     
    always @(posedge  clk )
     
    if ( n_reset == 0)
    counter <= 1;
 
    else if ( level_out == 1'b1)
    begin
    if (counter  < 5)
    counter <= counter +1;
    else counter <= 1;
    end
     
 
     
//always @(counter)
//case (counter)
//4'b0000:seg_data=7'b1000000;
//4'b0001:seg_data=7'b1111001;
//4'b0010:seg_data=7'b0100100;
//4'b0011:seg_data=7'b0110000;
//4'b0100:seg_data=7'b0011001;
//4'b0101:seg_data=7'b0010010;
//4'b0110:seg_data=7'b0000010;
//4'b0111:seg_data=7'b1111000;
//4'b1000:seg_data=7'b0000000;
//4'b1001:seg_data=7'b0010000;
//default:seg_data=7'b1111110;
//endcase
//assign anode=8'b11111110;
assign result = counter;
          
endmodule

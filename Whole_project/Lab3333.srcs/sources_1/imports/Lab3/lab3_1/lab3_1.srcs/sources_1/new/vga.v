`timescale 1ns / 1ps

module vga(
    input timeup,
    input [1:0] difi,
    input clk,
    input rst,
    input PS2_CLK, 
    input PS2_DATA,
    output Hsynq,
    output Vsynq,
    output reg [2:0] r, 
    output reg [2:0] g,
    output reg [1:0] b,
    output reg finish,
    output reg [7:0] eatapple
    );
    
wire [1:0] move;

    
Keyboard K2(clk, PS2_CLK, PS2_DATA, move);

wire clk_25M;
wire enable_V_Counter;
wire [9:0] H_Count_Value, V_Count_Value;

clock_divider clk_gen(clk, clk_25M);////
h_counter vga_h(clk_25M, enable_V_Counter, H_Count_Value);
v_counter vga_v(clk_25M, enable_V_Counter, V_Count_Value);

assign Hsynq = (H_Count_Value < 96) ? 1'b1:1'b0;
assign Vsynq = (V_Count_Value < 2) ? 1'b1:1'b0;


        parameter UP_BOUND = 60;  
        parameter DOWN_BOUND = 505;  
        parameter LEFT_BOUND = 170;  
        parameter RIGHT_BOUND = 765;
        
        reg h_speed, v_speed;  
        reg [9:0] up_pos, down_pos, left_pos, right_pos;  
        reg [9:0] blocku , blockd , blockl , blockr ;
        reg [5:0] multi;
        reg [5:0] multi2;
        reg [5:0] sd=1;
        reg [9:0] appleVu = 60, appleVd = 75, appleHl = 365, appleHr = 455;
        
       
        
   always @ (posedge clk_25M or posedge rst)  
        begin  
            if (rst) begin  
                r <= 3'b000;  
                g <= 3'b000;  
                b <= 2'b00;  
            end  
            else if(!multi||timeup) begin
                 if (rst) begin  
                    r <= 0;  
                    g <= 0;  
                    b <= 0;  
                  end  
                 else begin
                    if(H_Count_Value>240 & V_Count_Value>120 & H_Count_Value<300 & V_Count_Value<150) begin
                      r <= 3'b000;
                      g <= 3'b111;
                      b <= 2'b00;
                    end
                    else if(H_Count_Value>240 & V_Count_Value>149 & H_Count_Value<255 & V_Count_Value<210) begin
                      r <= 3'b000;
                      g <= 3'b111;
                      b <= 2'b00;         
                    end
                    else if(H_Count_Value>254 & V_Count_Value>192 & H_Count_Value<300 & V_Count_Value<210) begin
                      r <= 3'b000;
                      g <= 3'b111;
                      b <= 2'b00;
                    end
                    else if(H_Count_Value>282 & V_Count_Value>174 & H_Count_Value<300 & V_Count_Value<193) begin
                      r <= 3'b000;
                      g <= 3'b111;
                      b <= 2'b00;
                    end
                    else if((H_Count_Value>330 & V_Count_Value>120 & H_Count_Value<390 & V_Count_Value<210)) begin
                      if(H_Count_Value>345 & V_Count_Value>135 & H_Count_Value<375 & V_Count_Value<196)begin
                         r <= 3'b000;
                         g <= 3'b000;
                         b <= 2'b00;
                      end                    
                      else begin
                         r <= 3'b000;
                         g <= 3'b111;
                         b <= 2'b00;
                      end
                    end
                    else if (V_Count_Value>=up_pos && V_Count_Value<=down_pos && H_Count_Value>=left_pos && H_Count_Value<=right_pos) begin  
                    r <= 3'b000;  
                    g <= 3'b111;  
                    b <= 2'b00;   
                end  
                 else if (V_Count_Value>=blocku && V_Count_Value<=blockd&& H_Count_Value>=blockl && H_Count_Value<=blockr) begin  
                    r <= 3'b111;  
                    g <= 3'b000;  
                    b <= 2'b00; 
                end
                   else begin
                     r <= 3'b000;  
                     g <= 3'b000;  
                     b <= 2'b00;  
                   end
               end
               end   
               
                else if(finish) begin
                 if(H_Count_Value>192 & V_Count_Value>120 & H_Count_Value <252 & V_Count_Value<210)begin
            if(H_Count_Value>212 & H_Count_Value<242 & V_Count_Value>135 & V_Count_Value<196)begin
                r = 0;
                g = 0;
                b = 0;
            end
            else begin
                 r <= 3'b000;  
                    g <= 3'b111;  
                    b <= 2'b00;  
            end
       end
       else if(H_Count_Value>282 & H_Count_Value<300 & V_Count_Value>120 & V_Count_Value<210)begin
            r <= 3'b000;  
                    g <= 3'b111;  
                    b <= 2'b00;  
       end
       else if(H_Count_Value>330 & H_Count_Value<390 & V_Count_Value>120 & V_Count_Value<210)begin
            if(H_Count_Value>348 & V_Count_Value>138 & V_Count_Value<156)begin
            r = 0;
                g = 0;
                b = 0;
            end
            else if(H_Count_Value>348 & V_Count_Value>174 & V_Count_Value<192)begin
                r = 0;
                g = 0;
                b = 0;
            end
            else begin
                 r <= 3'b000;  
                    g <= 3'b111;  
                    b <= 2'b00;  
            end
       end
       else begin
            r = 0;
            g = 0;
            b = 0;
       end
    
               end    
               
                     
            else begin
                if (V_Count_Value>=up_pos && V_Count_Value<=down_pos && H_Count_Value>=left_pos && H_Count_Value<=right_pos) begin  
                    r <= 3'b000;  
                    g <= 3'b111;  
                    b <= 2'b00;   
                end  
                else if (V_Count_Value>=blocku && V_Count_Value<=blockd&& H_Count_Value>=blockl && H_Count_Value<=blockr) begin  
                    r <= 3'b111;  
                    g <= 3'b000;  
                    b <= 2'b00; 
                end
                else if (V_Count_Value>=appleVu && V_Count_Value<=appleVd&& H_Count_Value>=appleHl && H_Count_Value<=appleHr) begin
                    r <= 3'b111;  
                    g <= 3'b000;  
                    b <= 2'b00;
                end
                else begin
                    r <= 3'b000;  
                    g <= 3'b000;  
                    b <= 2'b00; 
                end
            end  
            end

        always @ (negedge Vsynq or posedge rst)  
        begin  
            if (rst) begin  
                h_speed <= 1;  
                v_speed <= 0; 
                eatapple <= 0;
            end  
            else begin  
                if (up_pos <= UP_BOUND)  
                    v_speed <= 1;  
                else if ((down_pos >= DOWN_BOUND)||(down_pos >= blocku && left_pos <= blockr && right_pos >= blockl))  
                    v_speed <= 0;  
                else  
                    v_speed <= v_speed;  
                  
                if (left_pos <= LEFT_BOUND)  
                    h_speed <= 1;  
                else if (right_pos >= RIGHT_BOUND)  
                    h_speed <= 0;  
                else  
                    h_speed <= h_speed;  
                    
                if (down_pos >= appleVu && up_pos <= appleVd && right_pos >= appleHl && left_pos <= appleHr)
                    eatapple <= eatapple + 1;
                else
                    eatapple <= eatapple;
            end  
        end  
        always @(posedge clk or posedge rst) begin
        if(rst) begin
          finish<=0;
        end
        else begin
        if((down_pos >= DOWN_BOUND))
          finish<=1;
        else
          finish<=finish;
        end
        end
        
        always @(difi or rst)begin
            if(rst)
                multi <= 0;
            else 
                multi <= 1*difi;
            end
            
        always @(difi or rst)begin
            if(rst)
                multi2 <= 0;
            else 
                multi2 <= sd;
            end
        
        always @ (posedge Vsynq or posedge rst)  
        begin  
            if (rst) begin  
                up_pos <= 250;  
                down_pos <= 280;  
                left_pos <= 450;  
                right_pos <= 480; 
            end  
            else if(finish || timeup) begin
                up_pos <= 250;  
                down_pos <= 250;  
                left_pos <= 250;  
                right_pos <= 250; 
            end
            else begin  
                if (v_speed) begin  
                    up_pos <= up_pos+multi;  
                    down_pos <= down_pos+multi;  
                end  
                else begin  
                    up_pos <= up_pos-multi;  
                    down_pos <= down_pos-multi;  
                end  
                  
                if (h_speed) begin  
                    left_pos <= left_pos+multi2;  
                    right_pos <= right_pos+multi2;  
                end  
                else begin  
                    left_pos <= left_pos-multi2;  
                    right_pos <= right_pos-multi2;  
                end  
            end  
        end
        
        /////below is added
      always @ (posedge Vsynq or posedge rst)  
       begin  
           if (rst) begin  
               blocku <= 487; 
               blockd <= 505; 
               blockl <= 320; 
               blockr <= 400; 
           end  
           else begin  
               if (move==2'b10&&blockl>=LEFT_BOUND) begin  
                   blockl <= blockl-6;  
                   blockr <= blockr-6;
               end  
               else if (move==2'b01&&blockr<=RIGHT_BOUND) begin  
                   blockl <= blockl+6;  
                   blockr <= blockr+6;
               end  
               else begin  
                   blockl <= blockl;  
                   blockr <= blockr;
               end               
           end  
       end
      
      
      //fangxiang
    always @ (posedge Vsynq or posedge rst)  
    begin  
        if (rst) begin  
            sd<=1;
        end  
    else begin  
      if (down_pos>=blocku) begin  
          if(move==2'b10&&h_speed==1)begin
             if(sd<=4)
             sd<=sd+1;
             else
             sd<=sd;
             end
          else if(move==2'b01&&h_speed==0) begin
             if(sd<=4)
             sd<=sd+1;
             else
             sd<=sd;
             end
          else if(move==2'b10&&h_speed==0) begin
             if(sd>=2)
             sd<=sd-1;
             else
             sd<=sd;
             end
             
          else if(move==2'b01&&h_speed==1 )begin
             if(sd>=2)
             sd<=sd-1;
             else
             sd<=sd;
             end
             
          else 
             sd<=sd;
      end  
          else 
             sd<=sd;
      end  
    end


endmodule
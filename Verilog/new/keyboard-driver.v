`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2020 12:45:51 PM
// Design Name: 
// Module Name: Keyboard_2
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


module Keyboard(
    input CLK100MHZ,	//board clock
    input PS2_CLK,	//keyboard clock and data signals
    input PS2_DATA,
    output wire [1:0] move	//10 for going left, 00 for not moving, 01 for going right
   );


	wire [7:0] W = 8'h1D;
	wire [7:0] S = 8'h1B;
	wire [7:0] A = 8'h1C;
	wire [7:0] D = 8'h23;
	wire [15:0] left = 16'hE06B;
	wire [15:0] right = 16'hE074;
	wire [7:0] stop = 8'hF0;

	reg isReading;				 
	reg [11:0] count_reading;		
	reg prevCLK;			
	reg scan_err;				
	reg [10:0] scan_code;			
	reg [7:0] CODEWORD;			
	reg getFull;				
	reg [3:0]count;				
	reg CLK400KHZ = 0;			 
	reg [7:0]DOWNCOUNTER = 0;
	reg is_arrow = 0;
	reg ending = 0;
	reg [3:0] out;

	//Set initial values
	initial begin
		prevCLK = 1;		
		scan_err = 0;		
		scan_code = 0;
		count = 0;			
		CODEWORD = 0;
		out = 0;
		isReading = 0;
		count_reading = 0;
	end

	always @(posedge CLK100MHZ) begin				//This reduces the frequency 250 times
		if (DOWNCOUNTER < 249) begin			
			DOWNCOUNTER <= DOWNCOUNTER + 1;
			CLK400KHZ <= 0;
		end
		else begin
			DOWNCOUNTER <= 0;
			CLK400KHZ <= 1;
		end
	end
	
	always @(posedge CLK100MHZ) begin	
		if (CLK400KHZ) begin
			if (isReading)				
				count_reading <= count_reading + 1;
			else 						
				count_reading <= 0;			
		end
	end


	always @(posedge CLK100MHZ) begin		
	if (CLK400KHZ) begin						
		if (PS2_CLK != prevCLK) begin			
			if (!PS2_CLK) begin				
				isReading <= 1;				
				scan_err <= 0;				
				scan_code[10:0] <= {PS2_DATA, scan_code[10:1]};	
				count <= count + 1;			
			end
		end
		else if (count == 11) begin				
			count <= 0;
			isReading <= 0;					
			getFull <= 1;				
			//calculate scan_err using parity bit
			if (!scan_code[10] || scan_code[0] || !(scan_code[1]^scan_code[2]^scan_code[3]^scan_code[4]
				^scan_code[5]^scan_code[6]^scan_code[7]^scan_code[8]
				^scan_code[9]))
				scan_err <= 1;
			else 
				scan_err <= 0;
		end	
		else  begin						
			getFull <= 0;					
			if (count < 11 && count_reading >= 4000) begin	
				count <= 0;				
				isReading <= 0;				
			end
		end
	prevCLK <= PS2_CLK;					
	end
	end


	always @(posedge CLK100MHZ) begin
		if (CLK400KHZ) begin					
			if (getFull) begin				
				if (scan_err) begin			
					CODEWORD <= 8'd0;		
				end
				else begin
					CODEWORD <= scan_code[8:1];	
				end				
			end					
			else CODEWORD <= 8'd0;				
		end
		else CODEWORD <= 8'd0;					
	end
	
	always @(posedge CLK100MHZ) begin
	    if(ending == 1)begin
	       if(CODEWORD == A || CODEWORD == D || CODEWORD == left[7:0] || CODEWORD == right[7:0])
	           ending = 0;
	    end
        else if (CODEWORD == A && ~ending)begin
            out <= 4'b1000;
        end
        else if(CODEWORD == D && ~ending)begin
            out <= 4'b0100;
        end
        else if(CODEWORD == left[15:8])begin
            is_arrow = 1;
        end
        else if(CODEWORD == stop)begin
            is_arrow = 0;
            ending = 1;
            out <= 4'b0000;
        end
        else if(is_arrow) begin
            if(CODEWORD == left[7:0])begin
                out <= 4'b0010;
            end
            if(CODEWORD == right[7:0]) out <= 4'b0001;
        end
    end    
        
    assign move = out[3:2];    
endmodule


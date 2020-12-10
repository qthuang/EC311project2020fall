`timescale 1ns / 1ps

module h_counter(
    input clk_25MHz,
    output reg enable_V_counter = 0,
    output reg [9:0] H_Count_Value = 0
);

    always@(posedge clk_25MHz) begin
        if (H_Count_Value < 800) begin
            H_Count_Value <= H_Count_Value + 1;
            enable_V_counter <= 0;
        end
        else begin
            H_Count_Value <= 0;
            enable_V_counter <= 1;
        end
    end
endmodule
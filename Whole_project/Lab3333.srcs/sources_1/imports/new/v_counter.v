`timescale 1ns / 1ps

module v_counter(
    input clk_25MHz,
    input enable_V_Counter,
    output reg [9:0] V_Count_Value = 0
);

    always@(posedge clk_25MHz) begin
        if (enable_V_Counter == 1'b1) begin
            if (V_Count_Value < 524)
                V_Count_Value <= V_Count_Value + 1;
            else
                V_Count_Value <= 0;
            end
        end
endmodule
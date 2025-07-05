`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2025 06:41:51 PM
// Design Name: 
// Module Name: Clock_divider_100MHz_to_1Hz
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


module Clock_divider_100MHz_to_1Hz(
    output reg Clock_1Hz,    
    input  Clock_100MHz, Clear_n
);
    reg [25:0] count_50000000;

    always @(posedge Clock_100MHz or negedge Clear_n) begin
        if (!Clear_n) begin
            count_50000000 <= 0;
            Clock_1Hz <= 0;
        end         
        else if (count_50000000 == 49999999) begin
            count_50000000 <= 0;
            Clock_1Hz <= ~Clock_1Hz;                                
        end else begin
            count_50000000 <= count_50000000 + 1; 
        end
    end
endmodule

   

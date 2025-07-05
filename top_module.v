`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2025 06:43:22 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input clk_100MHz,
    input rst_n,
    output [3:0] q
);
    wire clk_1Hz;

    // Instantiate clock divider
    Clock_divider_100MHz_to_1Hz divider_inst(
        .Clock_1Hz(clk_1Hz),
        .Clock_100MHz(clk_100MHz),
        .Clear_n(rst_n)
    );

    // Instantiate BCD counter
    counter_b counter_inst(
        .clk(clk_1Hz),
        .reset_n(rst_n),
        .q(q)
    );
endmodule


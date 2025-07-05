`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2025 06:44:05 PM
// Design Name: 
// Module Name: top_module_tb
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


module top_module_tb();

    reg clk_100MHz_tb;
    reg rst_n_tb;
    wire [3:0] q_tb;

    // Instantiate DUT
    

    // 100MHz clock (10ns period)
    initial clk_100MHz_tb = 0;
    always #5 clk_100MHz_tb = ~clk_100MHz_tb;

    initial begin
        // Initialize reset
        rst_n_tb = 0;
        #100 rst_n_tb = 1;

        // Run simulation long enough to observe output
        #1200000000 $finish;  // 1.2s simulation time
    end
endmodule

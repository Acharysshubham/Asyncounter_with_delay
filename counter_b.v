`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2025 06:42:32 PM
// Design Name: 
// Module Name: counter_b
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


module counter_b(
    input clk, reset_n,
    output reg [3:0] q
);
    wire j0, k0, j1, k1, j2, k2;

    // Reset when q = 5 (0101)
    wire reset_bcd = (q == 4'b0101);

    // Corrected JK assignments
    assign j0 = 1'b1;
    assign k0 = 1'b1;

    assign j1 = q[0];
    assign k1 = q[0];

    assign j2 = q[1] & q[0];
    assign k2 = q[1] & q[0];

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n || reset_bcd) begin
            q <= 4'b0000;
        end else begin
            // JK Flip-Flop behavior
            q[0] <= j0 ^ q[0];  // T flip-flop
            q[1] <= (j1 & ~q[1]) | (~k1 & q[1]);
            q[2] <= (j2 & ~q[2]) | (~k2 & q[2]);
            q[3] <= 1'b0; // Unused, hold at 0
        end
    end
endmodule

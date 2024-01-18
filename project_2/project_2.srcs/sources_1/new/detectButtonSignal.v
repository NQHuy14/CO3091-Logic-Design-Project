`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 11:13:02 PM
// Design Name: 
// Module Name: detectButtonSignal
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


module detectButtonSignal(input sig, input clk, output p);
    reg [1:0] sig_ly;
    
    always @(sig) begin
        sig_ly[0] <= sig;
        sig_ly[1] <= sig_ly[0];
    end
    
    assign p = sig_ly[0] & ~sig_ly[1];

endmodule

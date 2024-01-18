`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 04:19:38 PM
// Design Name: 
// Module Name: startCount
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


module startCount( input clk,input [3:0] btn, output reg startCount,output reg stopCount,output reg resetCount);
    always @(posedge clk) begin 
        if(btn[0]== 1'b1) begin 
                resetCount <=1'b0;
                startCount<=1'b1;
                stopCount<=1'b0;
        end 
    end 
endmodule

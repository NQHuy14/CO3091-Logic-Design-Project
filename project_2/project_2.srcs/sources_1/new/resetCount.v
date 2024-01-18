`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2023 10:51:18 AM
// Design Name: 
// Module Name: resetCount
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


module resetCount(input clk,input [3:0]btn,output reg startCount,output reg stopCount,output reg resetCount);

        always @(posedge clk) begin 
            if(btn[2]==1'b1) begin 
                resetCount <=1'b1;
                startCount<=1'b0;
                stopCount<=1'b0;
            end 
        
        end 
endmodule

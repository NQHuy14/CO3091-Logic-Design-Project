`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 01:09:22 PM
// Design Name: 
// Module Name: runYear
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


module runYear(input clk,input firstTimeOpenYear,output reg turnOfFirstTimeYear,output reg [4:0] year, output [3:0] y1,
output [3:0] y2,output [3:0] y3,output [3:0] y4,output reg [4:0] year1);
       always @(posedge clk) begin 
            if(firstTimeOpenYear == 1'b0) begin 
                year <= 5'b10100;
                year1 <= 5'b11000;
                turnOfFirstTimeYear <= 1'b1;
            end 
       end 
 assign y1 = year / 5'b01010;
 assign y2 = year % 5'b01010;
 
 assign y3 = year1 / 5'b01010;
 assign y4 = year1 % 5'b01010;
    

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 09:42:51 AM
// Design Name: 
// Module Name: getSecond
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


module getSecond( input clk,output reg enable);
    reg [24:0] counter;       
    always @(posedge clk) begin 
         if ( counter == 25'd10000000) begin // Adjust this value for the desired blink frequency
             counter <= 0;
             enable<=1;
        end else begin
             counter <=  counter + 1;
             enable<=0;
        end
    end
endmodule

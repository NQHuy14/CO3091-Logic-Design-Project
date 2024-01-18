`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2023 02:04:58 PM
// Design Name: 
// Module Name: Blink_LED
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


module Blink_LED(
    input clk,   // System clock input
     output reg led );
   reg [24:0] counter; // 25-bit counter for blinking frequency
 
    
     
    always @(posedge clk) begin
        if (counter == 25'd12500000) begin // Adjust this value for the desired blink frequency
            counter <= 0;
            led <= ~led; // Toggle the LED output

           
        end else begin
            counter <= counter + 1;
        end
             
    end

endmodule
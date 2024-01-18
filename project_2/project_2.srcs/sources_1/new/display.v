`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 12:30:44 PM
// Design Name: 
// Module Name: display
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


module display( input [3:0] value ,output reg [3:0] led);

    always @(value) begin
       case (value)
         4'b0000: begin
            led <= 4'b0000;
         end 
         4'b0001: begin
         led <= 4'b0001;
         
         end 
         4'b0010: begin
         led <= 4'b0010;
         
         end
         4'b0011: begin
         led <= 4'b0011;
         
         end 
         4'b0100: begin
         led <= 4'b0100;
         
         end 
         4'b0101: begin
         led <= 4'b0101;
         
         end 
         4'b0110: begin
         led <= 4'b0110;
         
         end 
         4'b0111: begin
         led <= 4'b0111;
         
         end 
         4'b1000: begin
         led <= 4'b1000;
         
         end 
         4'b1001: begin
         led <= 4'b1001;
         
         end 
       endcase 
    
    
    end 
endmodule

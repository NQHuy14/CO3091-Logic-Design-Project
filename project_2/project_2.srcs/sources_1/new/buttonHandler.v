`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2023 08:38:10 AM
// Design Name: 
// Module Name: buttonHandler
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


module buttonHandler(input clk,input buttonsignal,output reg value);
    reg button_prev;
    
    reg button_debounced;
    parameter COUNTER_MAX = 1000000;
    reg [19:0] counter;
    
    always @(posedge clk) begin
    if (counter == COUNTER_MAX) begin
        
        counter <= 0;
        
        button_debounced <= buttonsignal;
    end else begin
        
        counter <= counter + 1;
    end
  end
  
  always @(posedge clk) begin
    
    button_prev <= button_debounced;
   
    value <= button_debounced & ~button_prev;
end

endmodule

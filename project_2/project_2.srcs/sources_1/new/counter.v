`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 04:09:49 PM
// Design Name: 
// Module Name: counter
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


module counter( input clk, input enable, output reg [6:0] firstCounter,
output reg [6:0] secondCounter, output [3:0] c1, output [3:0] c2, output [3:0] c3,output [3:0] c4,input [3:0] btn ,input startCount, input stopCount, input resetCount);
   

    always @( posedge clk) begin 
        if(startCount==1) begin  // start count 
            if(enable == 1'b1) begin
                firstCounter <= firstCounter + 7'd1;
                if(firstCounter == 7'd99) begin 
                    secondCounter <= secondCounter + 7'd1;
                    firstCounter <= 7'd0;
                end 
            end 
        end else if(resetCount==1'b1) begin // reset count
            firstCounter <= 7'd0;
            secondCounter <= 7'd0;
        end else if(stopCount ==1'b1) begin 
            // do nothing 
        
        end 
       
    
    end 
    assign c1 = firstCounter %10;
    assign c2 = firstCounter/10;
    assign c3 = secondCounter %10;
    assign c4 = secondCounter/10;

endmodule

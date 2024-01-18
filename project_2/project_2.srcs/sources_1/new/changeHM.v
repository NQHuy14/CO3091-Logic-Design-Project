`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2023 02:45:48 PM
// Design Name: 
// Module Name: changeHM
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


module changeHM(clk,ch1,ch2,cm1,cm2,chour,cminutes,hour,minutes,changeLed,firstTImeChange,btn);
        input clk;
        output [3:0] ch1,ch2,cm1,cm2;
        output reg chour,cminutes,hour,minutes;
        output reg [5:0] changeLed;
        output reg firstTImeChange;
        input [3:0] btn;
        always @(posedge clk) begin 
            if(firstTImeChange == 0) begin 
                firstTImeChange =1;
                chour<=hour;
                cminutes<=minutes;
            end 
            if(btn[1]== 1'b1) begin 
                changeLed <= changeLed +1;
            end 
            if(changeLed % 2 == 0) begin 
                if(btn[0]==1'b1) begin 
                    cminutes <= cminutes+1;
                    if(cminutes == 60) cminutes <= 0; 
                end
            
            end else begin
                if(btn[0]==1'b1) begin 
                    chour <= chour +1;
                    if(chour == 24) begin 
                        chour <=0;
                    end 
                end 
            end
            
            if(btn[2]==1'b1) begin
                changeLed =0;
                minutes = cminutes;
                hour = chour;
                firstTImeChange =0;
            end
            
        
        
        end 
    assign ch1=chour /10;
    assign ch2=chour%10;
    
    assign cm1=cminutes/10;
    assign cm2=cminutes%10;
endmodule

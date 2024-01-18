`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 11:05:07 PM
// Design Name: 
// Module Name: changeHourMin
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


module changeHourMin(clk,ch1,ch2,cm1,cm2,changeLedHM,SetChangeHM,startChangeHM,btn,chour,cminutes,hour,min);
    input clk,SetChangeHM,startChangeHM;
    input [3:0] changeLedHM;
    input [3:0] btn;
    output ch1,ch2,cm1,cm2;
    output reg [5:0] chour,cminutes,hour,min;
    
    
    always @(clk) begin 
        if(startChangeHM==1'b1) begin 
            if(changeLedHM==4'd0) begin
              if(btn[1]==1'b1) begin
                 cminutes <= cminutes +1; 
                 if(cminutes == 6'd60) begin 
                    cminutes <=6'd0;
                end  
             end 
           end else if (changeLedHM ==4'd1) begin 
                if(btn[1]==1'b1) begin 
                    chour<= chour +1;
                    if(chour == 6'd24) begin 
                        chour<=6'd0;
                    end 
                end 
           
           
           end 
        
        end 
        if(SetChangeHM == 1) begin // in oter state set to zero 
            hour <= chour;
            min  <= cminutes;
        end 
        
    
    end 

    assign ch1=chour /10;
    assign ch2=chour%10;
    
    assign cm1=cminutes/10;
    assign cm2=cminutes%10;
endmodule

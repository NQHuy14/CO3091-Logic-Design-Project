`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 12:05:18 PM
// Design Name: 
// Module Name: runHourMin
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


module runHourMin(clk,enable,a_second,
        a_hour,a_min,h1,h2,m1,m2,cursorIncreaseDay,ch1,ch2,cm1,cm2,btn,chour,cminutes,
        changeLed,firstTImeChange,status,alarmH,alarmM,led,controlBuzzer);
     input clk;
     input enable;
     input [3:0] btn;
     output reg [5:0] a_hour,a_min,a_second,chour,cminutes,changeLed;
     output [3:0] h1,h2,m1,m2,ch1,ch2,cm1,cm2;
     output reg cursorIncreaseDay,firstTImeChange;
     reg btn0,btn1,btn2,btn3;
     input [2:0] status;
     output reg [5:0]alarmH,alarmM;
     output reg led;
     output reg controlBuzzer;
     wire [3:0] newBtn;
    
     wire p0,p1,p2,p3;
     buttonHandler(clk,btn[0],p0);
     buttonHandler(clk,btn[1],p1);
     buttonHandler(clk,btn[2],p2);
     buttonHandler(clk,btn[3],p3);
     
     assign newBtn ={p3,p2,p1,p0};
     reg alarmFlag;
     reg start;
     
     
     always @ (posedge clk) begin 
     if(status == 3'b000) begin 
        if((alarmFlag ==1'd1) && (a_min ==alarmM) && (a_hour ==alarmH)  ) begin 
            start <=1'd1;
            controlBuzzer<=1'd1;
        end 

        if(newBtn == 4'b1000) begin 
            led =1'b0;
            start =1'd0;
            alarmFlag=1'd0;
            controlBuzzer<=1'd0;
            
        end 
        if(enable==1) begin 
          if(start == 1'd1) begin 
            led=~led;
          end 
            cursorIncreaseDay<=0;
            a_second<=a_second+6'd1; // increasing second 
            if(a_second == 6'd60) begin
                 a_second<=6'd0;
                 a_min<=a_min+6'd1; // increasing min       
            end   
            if(a_min == 6'd60) begin 
                a_min <= 6'd0;
                a_hour<=a_hour+6'd1;
            end 
            
            if(a_hour == 6'd24) begin
                a_hour<=6'd0;
                cursorIncreaseDay<=1;
            end
            
        end

        end else if(status == 3'b100) begin 
         
               if(firstTImeChange == 0) begin 
                    chour <= a_hour;
                    cminutes <= a_min;
                    firstTImeChange <= 1'd1;
               end 
            if(newBtn == 4'b0010) begin 
               
                changeLed = changeLed +6'd1;
                 
              
            end       
            
            
            if(changeLed % 2 == 0) begin 
                if(newBtn==4'b0001) begin 
                
                
                    cminutes = cminutes+6'd000001;
                    if(cminutes == 6'd000060) cminutes = 6'd000000; 
                    
               
               end
            
            end else begin
               if(newBtn==4'b0001) begin 
                
                    
                  
                    chour = chour +6'd000001;
                    if(chour == 6'd000024) begin 
                        chour =6'd000000;
                    end
                   
                end 
                   end
                   
            if(newBtn ==4'b0100) begin
               
              
                changeLed =6'd0;
                a_min = cminutes;
                a_hour = chour;
                firstTImeChange =1'd0;
           
              
            end
         end else if(status == 3'b111) begin 
            if(newBtn == 4'b0001) begin 
                alarmM <= alarmM + 6'd1;
                if(alarmM >= 6'd60) begin 
                    alarmM <=0;
                end 
            end else if(newBtn==4'b0010) begin 
                alarmH <= alarmH + 6'd1;
                if(alarmH>=6'd24) begin 
                    alarmH <= 6'd0;
                end 
            end else if(newBtn == 4'b0100) begin 
                alarmFlag <=1'd1;
            
            end 
            
            
         
         end                                                            
     end
     
     
     
    assign h1=a_hour /10;
    assign h2=a_hour%10;
    
    assign m1=a_min/10;
    assign m2=a_min%10;
    
    assign ch1=chour /10;
    assign ch2=chour%10;
    
    assign cm1=cminutes/10;
    assign cm2=cminutes%10;
endmodule

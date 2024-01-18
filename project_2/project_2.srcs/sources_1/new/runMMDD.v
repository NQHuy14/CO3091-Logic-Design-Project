`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 01:09:02 PM
// Design Name: 
// Module Name: runMMDD
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


module runMMDD(input clk,output reg [5:0] month,output reg [5:0] day, input curSorForIncreaseDay,input firstTimeOpen,
output [3:0] mm1,
output [3:0]mm2,
output [3:0] dd1,
output [3:0] dd2,
output reg turnOffFirstTime,input [3:0] btn, output reg firstTimeChangeMMDD, output reg [5:0] changeLedForMMDD,input [2:0] status
,output [3:0] cmm1,
output [3:0] cmm2,
output [3:0] cdd1,
output [3:0]cdd2,
output reg [5:0] cmonth,
output reg [5:0] cday);
     wire [3:0] newBtn;
     wire p0,p1,p2,p3;
     buttonHandler(clk,btn[0],p0);
     buttonHandler(clk,btn[1],p1);
     buttonHandler(clk,btn[2],p2);
     buttonHandler(clk,btn[3],p3);
     
     assign newBtn = {p3,p2,p1,p0};

    
    always @ (posedge clk) begin 
       
          if(status == 3'b110) begin 
         
           if(firstTimeChangeMMDD == 1'b0) begin 
                cmonth <= month;
                cday <= day;
                firstTimeChangeMMDD <= 1'b1;
            
           end // first time change dd and mm
           if(newBtn == 4'b0010) begin 
                changeLedForMMDD = changeLedForMMDD + 6'd1;
           end 
           
           if(changeLedForMMDD % 2 ==0) begin 
                if(newBtn == 4'b0001) begin 
                    cmonth = cmonth + 6'd1;
                    if(cmonth == 6'd13) begin 
                        cmonth = 6'd1;
                    end 
                end 
           
           end else begin 
                 if(newBtn == 4'b0001) begin 
                    cday = cday + 1;
                    
            if (cmonth == 6'd1 || cmonth==6'd3 || cmonth==6'd5 || cmonth==6'd7 || cmonth == 6'd8 || cmonth == 6'd10) begin //tháng 1
                if (cday >= 6'd32) begin
                    cday <= 1;
                    cmonth <= cmonth + 1;
                end

            end else if (cmonth == 6'd2) begin //tháng 2
                if (cday >= 6'd29) begin
                    cday <= 1;
                    cmonth <= cmonth + 1;
                end

            end else if (cmonth == 6'd4 || cmonth == 6'd6 || cmonth == 6'd9 || cmonth == 6'd11) begin //tháng 4
                if (cday >= 6'd31) begin
                    cday <= 1;
                    cmonth <= cmonth + 1;
                end

            end   else if (cmonth == 6'd12) begin //tháng 12
                if (cday >= 6'd32) begin
                    cday <= 1;
                    cmonth <= 1;
                end
            end  
                    
                 
                 end
           
     
           
           
           end // end for changed day   
           
           if(newBtn == 4'b0100) begin 
                changeLedForMMDD =0;
                month <=cmonth;
                day <=cday;           
          end 
 
       end else if(status == 3'b001) begin 
            if(btn[3]==1) begin 
                month <= 0;
                day <= 1; 
            end 
       end  
       //
         if(curSorForIncreaseDay == 1'b1) begin 
            
            day <= day + 1;
            
             if (month == 6'd1 || month==6'd3 || month==6'd5 || month==6'd7 || month == 6'd8 || month == 6'd10) begin //tháng 1
                if (day >= 6'd32) begin
                    day <= 1;
                    month <= month + 1;
                end

            end else if (month == 6'd2) begin //tháng 2
                if (day >= 6'd29) begin
                    day <= 1;
                    month <= month + 1;
                end

            end else if (month == 6'd4 || month == 6'd6 || month == 6'd9 || month == 6'd11) begin //tháng 4
                if (day >= 6'd31) begin
                    day <= 1;
                    month <= month + 1;
                end

            end   else if (month == 6'd12) begin //tháng 12
                if (day >= 6'd32) begin
                    day <= 1;
                    month <= 1;
                end
            end        
            
        end 
     
        
    
    
    end 
    
    
 assign dd1=day/10;
 assign dd2=day%10;
 
 assign mm1 = month/10;
 
 assign mm2= month%10;
 // change dd mm
 
  assign cdd1= cday/10;
 assign cdd2= cday%10;
 
 assign cmm1 = cmonth/10;
 
 assign cmm2= cmonth%10;
 

endmodule

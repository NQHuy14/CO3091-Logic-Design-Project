`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 08:52:29 AM
// Design Name: 
// Module Name: root
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


module root( input sw0, input sw1,input sw2, input clk,
input [3:0] btn, 
output  led,
output  [3:0] led1,
output [3:0] led2,
output [3:0] led3,
output [3:0] led4,output buzzer);

reg [2:0] status;                          // status of FSM 
reg [3:0] Dled1,Dled2,Dled3,Dled4;       // this variable to pass value to led digit 
wire [3:0] h1,h2,m1,m2,mm1,mm2,dd1,dd2,y1,y2,y3,y4,c1,c2,c3,c4,ch1,ch2,cm1,cm2,cmm1,cmm2,cdd1,cdd2;  // divided the hour min second month day year into seperate digit

wire [2:0] p;                     // concatenate the switch signal

wire [5:0] hour,minutes,second;  // main counter for hour min and second 

wire [5:0] chour,cminutes; // main change for hour and min 

wire [5:0] month, day;    // main counter for month day and year
wire [5:0] cmonth,cday;
wire [4:0] year,year1;
wire [5:0] alarmH,alarmM;
wire enable;                // flag for increasing second 
wire curSorForIncreaseDay; // flag for increase day 
reg firstTimeOpen;        // flag for first time furn of the board
wire firstTimeOpenYear;


// flag turn of first time 
wire turnOfFirstTime;
wire turnofFirstTimeYear;

 wire [6:0] firstCounter,secondCounter;  // store the value for counter 

 reg startCount,stopCount,resetCount;  // variable for Counter function 
 

 assign p={sw2,sw1,sw0};            // concatenate two switch signal 

 wire [5:0]changeLed;// set to zero in the display hour and min 
 wire firstTImeChange; 
// wire [5:0] m,h;
// firstTime change for month and day 
 wire [5:0] changeLedForMMDD;
 wire firstTimeChangeMMDD;


 getSecond getseconnd(clk,enable);
 display Display0(Dled1,led1);
 display Display1(Dled2,led2);
 display Display2(Dled3,led3);
 display Display3(Dled4,led4);
 wire controlBuzzer;
 
   
  wire groupBtn;
  assign groupBtn={btn[3],btn[2],btn[1],btn[0]};
  
  runHourMin runClock(clk,enable,second,hour,minutes,h1,h2,m1,m2,curSorForIncreaseDay,ch1,ch2,cm1,cm2,btn,chour,cminutes,
        changeLed,firstTImeChange,status,alarmH,alarmM,led,controlBuzzer);
  runMMDD runmmdd(clk,month,day,curSorForIncreaseDay,firstTimeOpen,mm1,mm2,dd1,dd2,turnOfFirstTime,btn,firstTimeChangeMMDD,changeLedForMMDD,status,cmm1,cmm2,cdd1,cdd2,cmonth,cday);
  turnSomeModule turnOff(turnOfFirstTime,firstTimeOpen);
  runYear runyear(clk,firstTimeOpenYear,turnofFirstTimeYear,year,y1,y2,y3,y4,year1);
  counter(clk,enable,firstCounter,secondCounter,c1,c2,c3,c4,btn,startCount,stopCount,resetCount);
  buzzer buzz(clk,buzzer,controlBuzzer);


always @(posedge clk) begin 
    status <= p;
    case(status)
        3'b000: begin 
        Dled1 <= m2;
        Dled2 <= m1;  // display hour and minutes
        Dled3 <= h2;
        Dled4 <= h1;     
        end
        3'b001: begin 
        Dled1 <= mm2;
        Dled2 <= mm1;  // display month and day 
        Dled3 <= dd2;
        Dled4 <= dd1;
             

        end
        3'b010: begin 
            Dled1 <= y4;
            Dled2 <= y3;  // display year
            Dled3 <= y2;
            Dled4 <= y1;     
        end
        3'b011: begin  // counter  btn1 start btn2 stop btn 3 reset 
            Dled1 <= c1;
            Dled2 <= c2; // display counter
            Dled3 <= c3;
            Dled4 <= c4; 
            if(btn[2]==1'b1) begin 
                resetCount <=1'b1;
                startCount<=1'b0;
                stopCount<=1'b0;
            end      
            if(btn[0]== 1'b1) begin 
                resetCount <=1'b0;
                startCount<=1'b1;
                stopCount<=1'b0;
            end   
            if(btn[1]==1'b1)begin 
                resetCount <=1'b0;
                startCount<=1'b0;
                stopCount<=1'b1;
            end  
        end
        3'b100: begin // change parameter for change HM 
            Dled1 <= cm2;
            Dled2 <= cm1;  // display hour and minutes
            Dled3 <= ch2;
            Dled4 <= ch1;              
        end 
        3'b101: begin // change parametr for day and month 
            
        
        
        end
        3'b110: begin 
         Dled1 <= cmm2;
         Dled2 <= cmm1;  // display change month and day 
         Dled3 <= cdd2;
         Dled4 <= cdd1;            
        end 
        3'b111: begin // alarm 
         Dled1 <= alarmM %10;
         Dled2 <= alarmM/10;  // display for alarm
         Dled3 <= alarmH%10;
         Dled4 <= alarmH/10;          
        
        end 
           
    endcase
    
 
    

end 


endmodule

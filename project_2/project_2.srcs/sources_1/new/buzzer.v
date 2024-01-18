`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 11:36:49 AM
// Design Name: 
// Module Name: buzzer
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


// Define the clock frequency of the board
// Define the clock frequency of the board
`define CLOCK_FREQ 100000000

// Define the buzzer frequency and duration
`define BUZZER_FREQ 440 // 440 Hz (A4 note)
`define BUZZER_DUR  1000000 // 1 second

// Define the module with input clock and output buzzer
module buzzer(
  input wire clk,
  output wire buzzer,input controlBuzzer
);

  // Declare internal signals
  reg [31:0] counter; // 32-bit counter
  reg [31:0] period; // Period of the buzzer
  reg [31:0] on_time; // On time of the buzzer
  reg [31:0] off_time; // Off time of the buzzer
  reg buzzer_state; // State of the buzzer (on or off)

  // Initialize the period, on_time and off_time
  initial begin
    period = `CLOCK_FREQ / `BUZZER_FREQ; // Number of clock cycles for one buzzer cycle
    on_time = period / 2; // Number of clock cycles for buzzer on
    off_time = period - on_time; // Number of clock cycles for buzzer off
  end

  // Reset the counter and buzzer_state at the start
  initial begin
    counter = 0;
    buzzer_state = 0;
  end

  // Generate a square wave for the buzzer output
  always @(posedge clk) begin
  if(controlBuzzer==1'd1) begin 
    // Increment the counter
    counter <= counter + 1;

    // Check if the counter reaches the buzzer duration
    if (counter == `BUZZER_DUR) begin
      // Reset the counter and buzzer_state
      counter <= 0;
      buzzer_state <= 0;
    end
    // Check if the buzzer_state is on
    else if (buzzer_state == 1) begin
      // Check if the counter reaches the on_time
      if (counter == on_time) begin
        // Toggle the buzzer_state and reset the counter
        buzzer_state <= ~buzzer_state;
        counter <= 0;
      end
    end
    // Check if the buzzer_state is off
    else if (buzzer_state == 0) begin
      // Check if the counter reaches the off_time
      if (counter == off_time) begin
        // Toggle the buzzer_state and reset the counter
        buzzer_state <= ~buzzer_state;
        counter <= 0;
      end
    end
   end // end for control buzzer
   else if(controlBuzzer==1'd0) begin 
        buzzer_state<=0;
   end  
  end

  // Assign the buzzer output to the buzzer_state
  assign buzzer = buzzer_state;

endmodule



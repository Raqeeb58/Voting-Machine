`timescale 1ns / 1ps
// Button control module for detecting valid button press and debouncing
module buttoncontrol(
input clk,            // System clock
input rst,            // Reset signal
input button,        // Button input
output reg voted     // Output signal indicating a valid vote
 );
 reg [31:0] counter;    // Counter for debouncing
 
  // Counter logic for debouncing
 always@(posedge clk)
 begin
    if(rst)
    begin
        counter<=0;                // Reset counter 
    end
    else
    begin
        if(button & counter<11)
        begin
        counter<=counter+1;       // Increment counter when button is pressed 
        end
        else if(!button)
        begin
            counter<=0;           // Reset counter when button is released
        end 
    end
 end
 // Voted signal logic
 always @(posedge clk)
 begin
    if(rst)
    begin
        voted<=1'b0;          // Reset voted signal
    end
    else if(counter==10)
     begin
        voted<=1'b1;          // Set voted signal when the button is pressed for sufficient time
     end
     else
     begin
        voted<=1'b0;          // Reset voted signal otherwise
     end
 end
endmodule

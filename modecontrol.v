`timescale 1ns / 1ps


module modecontrol(
input clk,                                     // Clock input
input rst,                                     // Reset input
input mode,                                    // Mode selection (0: voting, 1: display)
input vote_casted,                             // Signal indicating a vote has been casted succesfully
input display_candidate1,                      // Button input for displaying 
input display_candidate2,                      // Button input for displaying
input display_candidate3,                      // Button input for displaying
input display_candidate4,                      // Button input for displaying
input [7:0] candidate1_rcvd_votes,             // Vote count for candidate 1
input [7:0] candidate2_rcvd_votes,             // Vote count for candidate 2
input [7:0] candidate3_rcvd_votes,             // Vote count for candidate 3
input [7:0] candidate4_rcvd_votes,             // Vote count for candidate 4
output reg [7:0]led                            // 8-bit LED output for display
 );
// LED display logic    
always @(posedge clk)
begin
    if(rst)
    begin
        led<=0;                                   // Reset LED display
    end
    else if(mode==0 & vote_casted)
    begin
        led<=8'hff;                              // All LEDs on when a vote is cast in voting mode 
    end
    else if(mode==0 & !vote_casted)              
    begin
        led<=0;                                  // All LEDs off when waiting for a vote in voting mode
    
    end
    else if(mode==1)
    begin                                         // Display vote counts in display mode
        if(display_candidate1)
        begin
            led<=candidate1_rcvd_votes;
        end
        else if(display_candidate2)
        begin
            led<=candidate2_rcvd_votes;
        end
        else if(display_candidate3)
        begin
            led<=candidate3_rcvd_votes;
        end
        else if(display_candidate4)
        begin
            led<=candidate4_rcvd_votes;
        end
    end
end
endmodule

`timescale 1ns / 1ps
module vote_count(
input clk,                                     // Clock input
input rst,                                     // Reset input
input mode,                                    // Mode selection (0: voting, 1: display)
input voted_candidate1,                        // Vote signal for candidate 1
input voted_candidate2,                        // Vote signal for candidate 2
input voted_candidate3,                        // Vote signal for candidate 3 
input voted_candidate4,                        // Vote signal for candidate 4
output reg [7:0] votercvd_candidate1,          // Vote count for candidate 1
output reg [7:0] votercvd_candidate2,          // Vote count for candidate 2
output reg [7:0] votercvd_candidate3,          // Vote count for candidate 2
output reg [7:0] votercvd_candidate4           // Vote count for candidate 2
 );
 
 // Vote counting logic
always @(posedge clk)
begin
    if(rst)
    begin
            // Reset all vote counts
        votercvd_candidate1<=0;
        votercvd_candidate2<=0;
        votercvd_candidate3<=0;
        votercvd_candidate4<=0;
    end
    else 
    begin
            // Increment vote counts when in voting mode
        if(voted_candidate1 & mode==0)
             votercvd_candidate1<=votercvd_candidate1+1;  
        if(voted_candidate2 & mode==0)
             votercvd_candidate2<=votercvd_candidate2+1; 
        if(voted_candidate3 & mode==0)
             votercvd_candidate3<=votercvd_candidate3+1;  
        if(voted_candidate4 & mode==0)
            votercvd_candidate4<=votercvd_candidate4+1; 
    end       
end
endmodule

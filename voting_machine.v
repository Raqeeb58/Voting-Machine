`timescale 1ns / 1ps
// Top module for the voting machine
module voting_machine(
input clk,              // System clock
input rst,              // Reset signal
input mode,             // Mode: 0 for voting, 1 for result display
input candid1,        // Vote for candidate 1
input candid2,          // Vote for candidate 2
input candid3,          // Vote for candidate 3
input candid4,          // Vote for candidate 4          
output [7:0]led         // LED output for results or voting confirmation
 );
 // Wire declarations for vote signals
 wire voted1;
 wire voted2;
 wire voted3;
 wire voted4;
 // Wire declarations for vote counts
 wire [7:0]votercvd_candidate1;
 wire [7:0]votercvd_candidate2;
 wire [7:0]votercvd_candidate3;
 wire [7:0]votercvd_candidate4;
 
 wire vote_casted= voted1 | voted2 | voted3 | voted4 ;  // Logical OR to check if any vote has been cast

 // Instantiate button control modules for each candidate
 buttoncontrol bc1(
 .clk(clk),
 .rst(rst),
 .button(candid1),
 .voted(voted1)
 );
 
  buttoncontrol bc2(
 .clk(clk),
 .rst(rst),
 .button(candid2),
 .voted(voted2)
 );
 
  buttoncontrol bc3(
 .clk(clk),
 .rst(rst),
 .button(candid3),
 .voted(voted3)
 );
 
  buttoncontrol bc4(
 .clk(clk),
 .rst(rst),
 .button(candid4),
 .voted(voted4)
 );
 
   // Instantiate vote counting module
 vote_count VC(
 .clk(clk),
 .rst(rst),
 .mode(mode),
 .voted_candidate1(voted1),
 .voted_candidate2(voted2),
 .voted_candidate3(voted3),
 .voted_candidate4(voted4),
 . votercvd_candidate1(votercvd_candidate1),
 . votercvd_candidate2(votercvd_candidate2),
 . votercvd_candidate3(votercvd_candidate3),
 . votercvd_candidate4(votercvd_candidate4)
 );
 // Instantiate mode control module
modecontrol MC(
 .clk(clk),
 .rst(rst),
 .mode(mode),
 .vote_casted(vote_casted),
 .display_candidate1(candid1),
 .display_candidate2(candid2),
 .display_candidate3(candid3),
 .display_candidate4(candid4),
 .candidate1_rcvd_votes(votercvd_candidate1),
 .candidate2_rcvd_votes(votercvd_candidate2),
 .candidate3_rcvd_votes(votercvd_candidate3),
 .candidate4_rcvd_votes(votercvd_candidate4),
 .led(led)
 );
 
endmodule

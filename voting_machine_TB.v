`timescale 1ns / 1ps



module voting_machine_TB;
reg clk;
reg rst;
reg mode;
reg candid1;
reg candid2;
reg candid3;
reg candid4;
wire [7:0]led;
   // Instantiate the Unit Under Test (UUT)
voting_machine dut(clk,rst,mode,candid1,candid2,candid3,candid4,led);

// Clock generation
initial
begin
    clk=0;
    forever #5 clk=~clk;
end
 // Test scenario
initial 
begin
        
     rst=1;mode = 0;candid1 = 0;candid2 = 0;candid3 = 0;candid4 = 0;                // Initialize inputs
    
    #100 rst=0; mode=1'b0; candid1 = 0; candid2 = 0; candid3 = 0; candid4 = 0;      // Release reset and start testing
    #100 candid1=1'b1;candid2=1'b0;candid3=1'b0;candid4=1'b0;                       // Test voting for candidate 1
    #150  candid1 = 1'b0;
    #100 candid1=1'b1;candid2=1'b0;candid3=1'b0;candid4=1'b0;                       // Repeat voting for candidate 1
     #150  candid1 = 1'b0;
    #100 candid1=1'b1;candid2=1'b0;candid3=1'b0;candid4=1'b0;                       // Repeat voting for candidate 1
     #150  candid1 = 1'b0;
    #100 candid1=1'b1;candid2=1'b0;candid3=1'b0;candid4=1'b0;                       // Repeat voting for candidate 1
     #150  candid1 = 1'b0;
     #100 candid1=1'b1;candid2=1'b0;candid3=1'b0;candid4=1'b0;                      // Repeat voting for candidate 1
     #150  candid1 = 1'b0;
    
    #100 candid2=1'b1;candid1=1'b0;candid3=1'b0;candid4=1'b0;                      // Test voting for candidate 2
     #150  candid2 = 1'b0;
    #100 candid2=1'b1;candid1=1'b0;candid3=1'b0;candid4=1'b0;                      // Repeat voting for candidate 2
     #150  candid2 = 1'b0;
    #100 candid2=1'b1;candid1=1'b0;candid3=1'b0;candid4=1'b0;                      // Repeat voting for candidate 2
     #150  candid2 = 1'b0;
     #100 candid2=1'b1;candid1=1'b0;candid3=1'b0;candid4=1'b0;                     // Repeat voting for candidate 2
     #150  candid2 = 1'b0;
    
    #100 candid3=1'b1;candid1=1'b0;candid2=1'b0;candid4=1'b0;                      // Test voting for candidate 3
     #150  candid3 = 1'b0;
    #100 candid3=1'b1;candid1=1'b0;candid2=1'b0;candid4=1'b0;                      // Repeat voting for candidate 3
     #150  candid3 = 1'b0;
    
    #100 candid4=1'b1;candid1=1'b0;candid2=1'b0;candid3=1'b0;                      // Test voting for candidate 4
     #150  candid4 = 1'b0;
     #100 candid4=1'b1;candid1=1'b0;candid2=1'b0;candid3=1'b0;                     // Repeat voting for candidate 4
     #150  candid4 = 1'b0;
     #100 candid4=1'b1;candid1=1'b0;candid2=1'b0;candid3=1'b0;                     // Repeat voting for candidate 4
     #150  candid4 = 1'b0;
     #100 candid4=1'b1;candid1=1'b0;candid2=1'b0;candid3=1'b0;                     // Repeat voting for candidate 4
     #150  candid4 = 1'b0;
    
    #100 mode=1;                                                                   // Switch to display mode
    
    // Test display for each candidate
    #50 candid1=1'b1;candid2=1'b0;candid3=1'b0;candid4=1'b0;
    #50 candid2=1'b1;candid1=1'b0;candid3=1'b0;candid4=1'b0;
    #50 candid3=1'b1;candid1=1'b0;candid2=1'b0;candid4=1'b0;
    #50 candid4=1'b1;candid1=1'b0;candid2=1'b0;candid3=1'b0;
    #50 rst=1;                                                                      // Test reset
    #50 $finish;
end 
endmodule

# Voting-Machine
1. buttoncontrol Module (Debounce + Vote Detection)
   Purpose: Detects a valid button press (debounced).
How it works:
   A counter increments if the button is held down.
   If held for enough time (10 clock cycles), it sets voted = 1.
   Prevents noise or multiple counts from a single press.
2. vote_count Module
Purpose: Increments the vote count for each candidate.
How it works:
   On a valid vote signal (voted_candidateX), it increments the count for that candidate (only in voting mode, mode = 0).
   If reset is high, all counts are cleared.
3. modecontrol Module
Purpose: Controls the LED output based on the mode and input buttons.
How it works:
  Mode = 0 (Voting mode):
  If any vote is cast (vote_casted = 1), turn on all LEDs (led = 8'hFF).
  Otherwise, keep LEDs off.
  Mode = 1 (Display mode):
  When a button is pressed, show the respective candidate’s vote count on the LED output.

4.voting_machine Top Module
Purpose: Connects everything together.
How it works:
  Instantiates 4 buttoncontrol modules (one per candidate).
  Instantiates one vote_count module and one modecontrol module.
  Wires everything properly so that:
  Button presses are debounced.
  Valid votes are counted.
  LEDs display voting or result information based on the mode.



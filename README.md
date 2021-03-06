# Code Breaker for Tandy 100/102

https://github.com/48kRAM/m100-codebreaker

Entry in the 2018 BASIC 10-line game contest, in the `PUR80` category.

Due to the severly limited space in the code, there are no in-game instructions. Please refer to this README instead.

This is a logic/code-breaking game in the style of "Master Mind". The player must
try to guess a random 4-digit code generated by the computer. Valid numbers are 1 through6.

Response is given in
a code of empty and filled glpyhs on the screen. Filled glyphs (&diams;) correspond to a correct
number in the correct position. Empty glyphs (&loz;) correspond to a correct number in an
incorrect position. As an example, if the secret code is:

`1452`

then a guess of `1,2,3,4` would display &diams; &loz; &loz;

Note: Glpyhs used on the Model 100 differ somewhat from what's use in this README.

This game will work out of the box on a Tandy 100 or 102. Modifications are required to run on a 200.

## Entering your guess

Enter you guess as a series of comma-separated numbers. For example:

`3,1,4,5`

pressing the ENTER key once after all digits have been typed. You may use the backspace key to correct
or change your entry before pressing ENTER.

## Running the game

### Running on real hardware

To run the game on a real Tandy 100 or 102, use a TPDD emulator (LaddieAlpha, mComm, NADSbox, etc.) and a
DOS of your choice (TS-DOS, TEENY) to load the file `CODE.DO` onto the computer. Start `BASIC` and run:

`LOAD "CODE.DO"`

Type `RUN` to execute the program.

### Running in the "Virtual-T" emulator

Obtain Virtual-T from https://sourceforge.net/projects/virtualt/

Start Virtual-T, select "Model" from the "Emulation" menu, and ensure that either
M100 or M102 is selected. Open the "File" menu and choose "Load file from HD". Navigate to 
the CODE.DO file and click "Ok". The file should appear in the menu.

Start `BASIC` and run:

`LOAD "CODE.DO"`

Type `RUN` to execute the program.

## Code explanation

 1. Array 'C' holds secret code and the guess. Seed the random number generator. Generate the secret code.
 2. Game loop top. Clear input line. Show the number of turn remaining and input player guess.
 3. Call subroutine at 8 to print player guess. 'P' sets the correct column position and 'O' prints the guess rather than the secret code. Begin iterating over code digit positions. Detect a fully-correct digit and jump to line 5 if found.
 4. (We get here if digit is not fully correct). Iterate over digits in guess and detect a partially correct digit. When a partially-correct digit is found, jump to line 9.
 5. Continue the outer iteration loop. When done, call subroutine at 6. Increment the number of guesses (T). Then, if the game has been won, jump to line 9. If the game has been lost, jump to line 10. Otherwise, jump to line 2 so player can guess again.
 6. The subroutine on lines 6 through 7 prints the results of the player's guess using Tandy glyphs. These glyphs don't display properly on other platforms. One filled glyph is printed for each fully-correct digit, and one unfilled glyph is printed for each partially-correct digit.
 7. Continuation of subroutine at line 6.
 8. Iterate over the 'C' array, printing either the secret code or the player guess, depending on the value of 'O'. Screen position is calculated based on the value of 'P'.
 9. This line either finishes the routine started at line 5, or tells the player that he/she has won. The code before the ELSE was moved here from line 5 so that it fit in 80 characters.
 10. Tell the player she/he has lost and print out the secret code.
 
 ## Special thanks
 
 Thanks to Ken Pettit for the RNG seed routine. Thanks, also, to the M100 mailing list members for encouragement, as well as the years of support for all my Tandy endeavors. 

1 REM Code Breaker - by Josh Malone (@48kRAM)
2 REM github.com/48kRAM/m100-codebreaker
10 REM C - Code array [1-4 is secret code, 5-8 is player guess]
11 REM T - Tries taken;
12 REM O - Offset into code array used by code print routine
13 REM P - Screen position used by code print routine
14 REM B - Number of fully correct digits (black pegs)
15 REM W - Number of partly correct digits (white pegs)
100 CLS:DIM C(8)
110 REM Seed random number generator; must determine 100 or 200 model
111 TM=PEEK(-1745) : IF TM=PEEK(-1745) THEN GOTO 120
112 REM Model 100/102 RND seed routine
113 PRINT "Initializing M100 RND"
116 POKE -902,PEEK(-1745):GOTO 150
120 REM Model 200 RND seed routine
121 PRINT "Initializing M200 RND"
125 POKE -2259,PEEK(-3553)
150 FOR G=1 TO 4:C(G)=FIX(RND(1)*6)+1:NEXT
200 PRINT @240,TAB(40):PRINT @240,"Tries Left:";10-T;
210 INPUT "Guess";C(5),C(6),C(7),C(8)
300 O=5:P=T*20:GOSUB 800:W=0:B=0:FORX=1TO4:Z=X+4
310 IF C(X)=C(Z) THEN B=B+1:GOTO 500
400 FOR Y=5 TO 8:G=C(Y)
410 IF C(Y-4)<>G AND Y<>Z AND C(X)=G THEN GOTO 900 ELSE NEXT
500 NEXT X: GOSUB 600
510 T=T+1
520 IF B<>4 AND T=10 THEN 1000 ELSE IF B=4 THEN 900 ELSE 200
600 PRINT @T*20+6,"";:IF W>0 THEN FOR X=1 TO W:?CHR$(157);:NEXT
700 IF B>0 THEN FOR X=1TOB:? CHR$(228);:NEXT:RETURN:ELSE RETURN
800 REM Print a code. Must set O and P before calling
810 FOR X=OTO O+3:PRINT@P+(X-O),"";:PRINT USING"#";C(X);:NEXT:RETURN
900 IF B<>4 THEN W=W+1:C(Y)=0:GOTO 500
910 IF B=4 THEN ?@240,TAB(15);"You win!  ";:END
1000 REM Game over routine 
1100 PRINT @240, TAB(40)
1200 PRINT @240, "Game over! Code was    ";:O=1:P=260:GOSUB 800:END

100 CLS:DIMC(8):POKE-902,PEEK(-1745):FORG=1TO4:C(G)=FIX(RND(1)*6)+1:NEXT
120 PRINT@280,"CODE: ";:P=286:O=1:GOSUB800
200 PRINT@260,TAB(9):PRINT@240,"Left:";10-T;:INPUT"Guess";C(5),C(6),C(7),C(8)
300 O=5:P=T*20:GOSUB800:W=0:B=0:FORX=1TO4:IF C(X)=C(X+4) THEN B=B+1:GOTO 500
400 FORY=1TO4:IFX<>Y ANDC(Y)<>C(Y+4)AND C(Y)=C(X+4)THEN W=W+1:GOTO500ELSENEXT
500 NEXTX:GOSUB600:T=T+1:IF B<>4 AND T=10THEN1000ELSE IF B=4 THEN900 ELSE 200
600 PRINT@T*20+6,"";:IF W>0 THEN FORX=1TOW:PRINT"�";:NEXT
700 IF B>0 THEN FORX=1TOB:PRINT"�";:NEXT:RETURN:ELSE RETURN
800 FOR X=OTOO+3:PRINT@P+(X-O),"";:PRINTUSING"#";C(X);:NEXT:RETURN
900 PRINT @240,TAB(40):PRINT@240,"You win!":END
1000 PRINT@240,"Game over! Code was";C(0);C(1);C(2);C(3);

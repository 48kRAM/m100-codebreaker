100 CLS:DIMC(8):POKE-902,PEEK(-1745):FORG=1TO4:C(G)=FIX(RND(1)*6)+1:NEXT
200 PRINT@240,TAB(40):PRINT@240,"Left:";10-T;:INPUT"Guess";C(5),C(6),C(7),C(8)
300 O=5:P=T*20:GOSUB800:W=0:B=0:FORX=1TO4:Z=X+4:IFC(X)=C(Z)THENB=B+1:GOTO500
400 FORY=5TO8:G=C(Y):IF C(Y-4)<>G AND Y<>Z AND C(X)=G THENGOTO900ELSENEXT
500 NEXTX:GOSUB600:T=T+1:IF B<>4 AND T=10THEN1000ELSEIFB=4THEN900ELSE200
600 PRINT@T*20+6,"";:IF W>0 THEN FORX=1TOW:PRINT"�";:NEXT
700 IF B>0 THEN FORX=1TOB:PRINT"�";:NEXT:RETURN:ELSE RETURN
800 FOR X=OTOO+3:PRINT@P+(X-O),"";:PRINTUSING"#";C(X);:NEXT:RETURN
900 IFB<>4THENW=W+1:C(Y)=0:GOTO500ELSECLS:PRINT@177,"You win!":END
1000 PRINT@240,"Game over! Code was    ";:O=1:P=260:GOSUB800

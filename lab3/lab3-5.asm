DATA SEGMENT
    STR1 DB 30H, 31H, 32H, 33H, 34H, 35H, 36H, 37H, 38H, 39H, 40H, 41H, 42H, 43H, 44H, 45H
    STR2 DB 16 DUP(0)
DATA ENDS


CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    START:  MOV AX, DATA
            MOV DS, AX
            MOV ES, AX              ;the segment address is same
            LEA SI, STR1
            LEA DI, STR2        

            CLD
            MOV CX, 16
            REP MOVSB

            MOV AX, 4C00H
            INT 21H
CODE ENDS
END START



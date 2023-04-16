; LAB3-3
DATA SEGMENT
    NUMS DB 58, 25, 45, 73, 64, 43
    SUM DW ?
DATA ENDS


CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    START :
        ; set DATA SEGMENT
        MOV AX, DATA
        MOV DS, AX
        MOV AX, 0

        ; MAIN
        MOV CX, 6
        LEA DI, NUMS
        LEA SI, SUM
        MOV [SI], 0
        MOV AH, 0   ;High byte bit is cleared to zero, converting byte variable to word variable to calculate the sum
    S :     ;Calculae the sum of the unsigned numbers
        MOV AL, [DI]
        ADD [SI], AX
        INC DI
        LOOP S

        MOV AX, 4C00H
        int 21H
CODE ENDS
END START
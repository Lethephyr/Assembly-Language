; LAB3-1
DATA SEGMENT
    NUMS DB 22, 46, 32, 72, 84, 16, 156
    MAXN1 DB ?
    MAXN2 DB ?
DATA ENDS


CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    START :
        ; set DATA SEGMENT
        MOV AX, DATA
        MOV DS, AX
        MOV AX, 0

        ; MAIN
        MOV CX, 7
        LEA DI, NUMS
        LEA SI, MAXN1
        MOV AL, [DI] 
        MOV [SI], AL
    S :     ;FIND THE MAX NUMBER UNSIGNED
        MOV AL, [DI]
        CMP [SI], AL
        JNC MAX     ;JUMP IF GREATER OR EQUALS (UNSIGNED) 
        MOV [SI], AL
    MAX :
        INC DI
        LOOP S

        MOV CX, 7
        LEA DI, NUMS
        LEA SI, MAXN2
        MOV AL, [DI]
        MOV [SI], AL
    IS :    ;FIND THE MAX NUMBER SIGNED
        MOV AL, [DI]
        CMP [SI], AL
        JGE IMAX    ;JUMP IF GREATER OR EQUALS (SIGNED) 
        MOV [SI], AL
    IMAX :    
        INC DI
        LOOP IS

        MOV AX, 4C00H
        int 21H
CODE ENDS
end START
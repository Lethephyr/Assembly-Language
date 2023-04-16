DATA SEGMENT
    P_STR1 DB 13, 10, 'Enter 1st string: ', 13, 10, '$'
    P_STR2 DB 13, 10, 'Enter 2st string: ', 13, 10, '$'
    P_NOT DB 13, 10, 'The strings are not same', 13, 10, '$'
    P_SAME DB 13, 10, 'The strings are the same', 13, 10, '$'
    STR1 DB 10 DUP(?)
    RESULT1 DB 0FFH
    RESULT2 DB 0FFH
DATA ENDS

EXTRA SEGMENT
    STR2 DB 10 DUP(?)
EXTRA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    START:  
            MOV AX, DATA
            MOV DS, AX
;-----------INPUT---------------------------------------
            LEA DX, P_STR1
            CALL OUTPUT
            LEA BX, STR1
            CALL INPUT
            LEA DX, P_STR2
            CALL OUTPUT
            MOV AX, EXTRA
            MOV DS, AX
            LEA BX, STR2
            CALL INPUT
            MOV AX, DATA
            MOV DS, AX
;-----------INITIALIZE----------------------------------
            MOV AX, EXTRA
            MOV ES, AX
            LEA SI, STR1
            LEA DI, STR2
            MOV CX, 10
;-----------COMPARE THE TWO STRINGS---------------------
            CLD
            REPE CMPSB
            CMP DI, 0AH
            JE _SAME

    _NOT:   
            DEC DI
            DEC SI
            LEA DX, P_NOT           ;OUTPUT P_NOT
            CALL OUTPUT
            LEA BX, RESULT1
            MOV AX, DI
            MOV [BX], AL
            LEA BX, RESULT2
            MOV AL, [SI]
            MOV [BX], AL
            JMP QUIT   

    _SAME:  
            DEC DI
            DEC SI
            LEA DX, P_SAME          ;OUTPUT P_SAME
            CALL OUTPUT
            LEA DI, RESULT1
            MOV AL, 0
            MOV [DI], AL
            JMP QUIT

    INPUT:
            MOV CX, 10
            XOR SI, SI
        S:
            MOV AH, 01H
            INT 21H
            MOV [SI+BX], AL
            INC SI
            LOOP S
            RET

    OUTPUT:
            MOV AH, 9
            INT 21H
            RET

    QUIT:
            MOV Ah, 4CH
            INT 21H
CODE ENDS
END START
DATA SEGMENT
    X DB 10
    Y DB -5
    Z DB 100
    V DB 10
    RESULT1 DB ?
    RESULT2 DB ?
DATA ENDS

CODE SEGMENT
    START:  MOV AX, DATA
            MOV DS, AX

            XOR AH, AH
;------------(10*(-5))-------------------------
            LEA SI, X
            MOV AL, [SI]
            INC SI
            MOV BL, [SI]
            IMUL BL              ;store the product into AL
            ;XOR AH, AH          ;
;------------(10*(-5)+100)---------------------
            INC SI
            MOV BL, [SI]
            XCHG AX, BX             ;
            CBW						;solve the overflow issue
            XCHG AX, BX             ;
            ADD AX, BX
;------------(10*(-5)+100)/10
            INC SI
            MOV BL, [SI]
            IDIV BL              ;store the quotient into AL
                                ;store the remainder into AH
            LEA DI, RESULT1
            MOV [DI], AL
            INC DI
            MOV [DI], AH

            MOV AX, 4C00H
            INT 21H
CODE ENDS
END START

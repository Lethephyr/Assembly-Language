DATA SEGMENT
    VAR1  DQ  0503030408H
    VAR2  DB  09H
    SUM  DQ  0
DATA ENDS


CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    START:  MOV AX, DATA
            MOV DS, AX

            XOR AH, AH
            XOR BH, BH          ;load bh with progression
            MOV BL, VAR2        ;load bl with number VAR2
            LEA SI, VAR1
            LEA DI, SUM
            MOV CX, 5           ;set up loop counter

    S:      
            MOV AL, [SI]
            MUL BL
            AAM                 ;adjust after MUL
            ADD AL, BH
            AAA                 ;adjust after ADD
            MOV BH, AH          ;load bh with progression
            MOV [DI], AL        ;store the product into SUM
            INC SI
            INC DI
            LOOP S

            MOV [DI], BH

            MOV AX, 4C00H
            INT 21H
CODE ENDS
END START
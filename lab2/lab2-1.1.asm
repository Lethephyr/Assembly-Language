assume cs:code 

code segment 

    start:	MOV  AX, 0A0A0H
            ADD  AX, 0FFFFH
            MOV  CX, 0FF00H
            ADD  AX, CX
            SUB  AX, AX
            INC  AX
            OR   CX, 00FFH
            AND  CX, 0F0FH
            MOV  ds:[0010H], CX


            MOV AX, 4c00h 
            int 21h
code ends

end start
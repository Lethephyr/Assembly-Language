assume cs:code 

code segment 

    start:  MOV  AX, 00H
            DEC  AX
            ADC  AX, 3FFFH
            ADD  AX, AX
            NOT  AX
            SUB  AX, 3H
            OR   AX, 0FBFDH
            AND  AX, 0AFCFH
            SHL  AX, 1H
            RCL  AX, 1H


            MOV AX, 4c00h 
            int 21h
code ends

end start
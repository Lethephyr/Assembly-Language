assume cs:code 

code segment 

    start:  MOV  BL, 04H
            MOV  WORD  PTR ds:[0010H], 0080H
            MOV  AX, ds:[0010H]
            DIV  BL



            MOV AX, 4c00h 
            int 21h
code ends

end start
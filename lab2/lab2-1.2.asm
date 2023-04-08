assume cs:code 

code segment 

    start:  MOV BL, 25H
    	    MOV BYTE  PTR ds:[0010H], 04H
    	    MOV AL, ds:[0010H]
            MUL BL


            MOV AX, 4c00h 
            int 21h
code ends

end start
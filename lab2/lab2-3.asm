assume cs:code 

code segment 
    start:  mov al, 15H
            shl al, 1
            mov bl, 15H
            mul bl 

            mov ax, 4c00h 
            int 21h
code ends
end start
assume cs:code
code segment
    start:  mov si, 001Eh
    next:   mov word ptr ds:[si], 0000h
            sub si, 2
            cmp si, 000Eh
            jne next

            mov ax, 4c00h 
            int 21h
code ends
end start
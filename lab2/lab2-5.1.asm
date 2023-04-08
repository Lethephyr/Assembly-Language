assume cs:code
code segment
    start:  mov si, 0010h
    next:   mov word ptr ds:[si], 0000h
            add si, 0002h
            cmp si, 0020h
            jne next

            mov ax, 4c00h 
            int 21h
code ends
end start
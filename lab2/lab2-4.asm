assume cs:code 
code segment 
    start:  mov byte ptr ds:[0000H], 58H
            mov byte ptr ds:[0001H], 12H
            
            mov al, ds:[0000H]
            shr al, 1
            shr al, 1
            mul byte ptr ds:[0001H]
            mov ds:[0002H], ax

            mov ax, 4c00h 
            int 21h
code ends
end start
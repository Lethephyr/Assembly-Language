assume cs:code 
code segment 
    start:  mov bx, 0010h
            mov byte PTR ds:[bx], 10H
            mov byte PTR ds:[bx+1], 04H
            mov byte PTR ds:[bx+2], 30H

            mov al, ds:[bx]
            add al, ds:[bx+1]
            add al, ds:[bx+2]
            mov ds:[bx+3], al

            mov al, ds:[bx]
            mul byte PTR ds:[bx+1]
            mul byte PTR ds:[bx+2]
            mov ds:[bx+4], ax

            mov ax, 4c00h 
            int 21h
code ends
end start
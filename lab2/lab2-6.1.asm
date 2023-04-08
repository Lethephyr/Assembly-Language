assume cs:code, ds:data, ss:stack

data segment
    dw 3418h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h ;0-15
    dw 2798h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h ;0-15

data ends

stack segment
    dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;32
stack ends

code segment
    start :
        ;set stck segment
        mov ax, stack
        mov ss, ax
        mov sp, 20h

        ;set data segment
        mov ax, data
        mov ds, ax
        mov ax, 0

        ;code segment
        mov al, ds:[0000h]
        add al, ds:[0010h]
        daa
        mov ds:[0020h], al
        mov al, ds:[0001h]
        adc al, ds:[0011h]
        daa
        mov ds:[0021h], al

        mov ax, 4c00h
        int 21h
code ends
end start
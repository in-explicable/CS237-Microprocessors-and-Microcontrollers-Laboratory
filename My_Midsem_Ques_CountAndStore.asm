; multi-segment executable file template.

data segment
    array1 dw 130h,500h,40h,900h,1050h
    length db 05h
    array2 dw 05h dup(?)
    count db 00h
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    lea si, array1
    lea di, array2
    mov cl, length
            
repeat:
    mov ax,[si]
    cmp ax, 100h
    jc skip
    cmp ax, 1000h
    jnc skip
    inc count
    mov [di], ax
    inc di
    inc di
skip:
    inc si
    inc si
    loop repeat
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

; multi-segment executable file template.

data segment                   
    X db 5
    Y db ?
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov cl,02h
    mov al,X
    mov bl,X
    cube:
    mul bl
    loop cube
    mov cl,al
    
    mov al,X
    mov bl,03h
    mul bl
    mov bl,02h
    div bl
    
    sub cl,al
    mov Y,cl
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

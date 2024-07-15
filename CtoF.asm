; multi-segment executable file template.

data segment                 
    celsius db 32
    fahrenheit db ?
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov al,celsius
    mov bl,9
    mul bl
    mov bl,5
    div bl
    add al,32
    mov fahrenheit,al
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

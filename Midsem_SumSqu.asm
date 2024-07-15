; multi-segment executable file template.

data segment                    
    array db 1,2,3,4,5
    count db 05h
    sum_squ db ?
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
                                  
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

;Name: Seshan S, Reg No: 21EC1093
;Scan a character in a string
; multi-segment executable file template.

data segment
    string db "hello world$"
    char db "w$"  
    count db 11
    msg1 db "Character found $"
    msg2 db "Character not found $"
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    cld
    lea si, string
    mov bl, char 
    mov cl, count
    
    repeat:
    cmp [si], bl
    jz A
    inc si
    loop repeat
    lea dx, msg2
    mov ah, 9        
    int 21h
    jmp B
        
    A:
    lea dx, msg1
    mov ah, 9         
    int 21h
    jmp B
    
    B:         
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

; multi-segment executable file template.

data segment                     
    num dw 97  
    msg1 db "Prime number$"
    msg2 db "Not a prime number$"
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov cx,num
    dec cx
    
    repeat:  
    mov ax,num
    div cl
    add ah,0
    jz not_prime
    dec cl
    cmp cl,1
    jnz repeat
    
    mov ah,09h
    lea dx,msg1
    int 21h
    jmp skip
    
    not_prime:
    mov ah,09h
    lea dx,msg2
    int 21h
    
    skip:
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

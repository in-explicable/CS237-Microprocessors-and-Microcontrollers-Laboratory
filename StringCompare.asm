 ;Name: Nivesh S, Reg No: 21EC1063, Date:23/11/23
; multi-segment executable file template.

data segment
    str1 db "Microprocessor$"
    str2 db "Microprocessor$"     
    count db 14
    msg1 db "Strings are equal $"
    msg2 db "Strings are not equal $"
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    cld
    lea si, str1
    lea di, str2   
    mov cl,count
    
    repeat:
    mov ax,[si]
    mov bx,[di]
    cmp ax,bx
    jnz A          
    inc si
    inc di
    loop repeat
    
    lea dx, msg1
    mov ah, 09
    int 21h
    jmp B
    
    A:
    lea dx, msg2
    mov ah, 09
    int 21h
    
    B:
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

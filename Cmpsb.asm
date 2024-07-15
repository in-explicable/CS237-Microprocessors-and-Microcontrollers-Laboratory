;Name: Nivesh S, Reg No: 21EC1063, Date:23/11/23
; multi-segment executable file template.

data segment
    str1 db "Microprocessor$"
    str2 db "Microprocessor$"     
    count db 13
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
    repe cmpsb
    je A
    jne B    
    
    A:
    lea dx, msg1
    mov ah, 09
    int 21h
    hlt
    
    B:
    lea dx, msg2
    mov ah, 09
    int 21h
    hlt
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

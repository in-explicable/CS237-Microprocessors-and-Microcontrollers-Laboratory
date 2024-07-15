;Name: Nivesh S, Reg No: 21EC1063, Date:23/11/23
; multi-segment executable file template.

data segment
    str1 db "Microprocessor$"
    str2 db 14 dup(?),'$'    
    count db 14
    msg1 db "String 1:$"
    msg2 db 0DH, 0AH, "String 2:$" 
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    lea si, str1
    lea di, str2
    mov cl, count
    
    rep movsb
               
    lea dx, msg1
    mov ah, 09h
    int 21h     
                                              
    lea dx, str1
    mov ah, 09h
    int 21h   
    
    lea dx, msg2
    mov ah, 09h
    int 21h 
    
    lea dx, str2
    mov ah, 09h
    int 21h   
                                              
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

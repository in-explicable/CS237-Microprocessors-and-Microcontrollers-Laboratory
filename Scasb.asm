;Name: Nivesh.S, Reg No: 21EC1063
;Scan a character in a string
; multi-segment executable file template.

data segment
    string db "hello world$"
    char db "d$"  
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
    lea di, string      ;Load the effective address of string in di
    mov cl, count       ;Initialise the count value in cl
    mov al, char        ;Load the char to be found in al
    repne scasb
    jz A                ;If the char is found, jump to A
    mov dx, offset msg2
    mov ah, 9           ;Else print the char is not found
    int 21h
    jmp B
    
    A:
    mov dx, offset msg1 ;To print the char is found
    mov ah, 9
    int 21h   
             
    B:         
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"             
    array db 1,2,3,2,1
    str db "It's a palindrome! $"
ends                    

extra segment
    reverse db 05h dup (?)
ends


stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov ax, extra
    mov es, ax

    ; add your code here
    lea si, array
    lea di, reverse+04h 
    mov cx, 05h
    repeat:
    cld
    lodsb
    std
    stosb
    loop repeat
    
    lea si, array
    lea di, reverse 
    mov cx, 05h  
    cld
    repe cmpsb
    jnz skip
    lea dx, str
    mov ah,9
    int 21h
    
    skip:        
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

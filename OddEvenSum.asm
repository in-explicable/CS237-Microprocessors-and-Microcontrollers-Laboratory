; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    array db 1,2,3,4,5,6,7,8,9
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here    
    mov dx, 0
    lea si, array
    mov cx, 09h         
    back:
    mov al, [si]
    ror al, 01h
    jnc even
    inc bh ;Count odd numbers     
    add dh, [si]
    
    jmp next
    even: inc bl  ;Count even numbers
    add dl, [si]
    next: inc si
    loop back  
    
            
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

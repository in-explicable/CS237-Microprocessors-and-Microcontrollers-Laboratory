; multi-segment executable file template.

data segment                   
    A dw 1A1Ah
ends


code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    
    mov bx,A        ;For each digit, perform hex to ASCII 
    and bh,0F0h
    ror bh,04h 
    add bh,30h 
    cmp bh,39h
    jc print
    add bh,07h
    print:
    mov ah,02h
    mov dl,bh
    int 21h
    
    mov bx,A
    and bh,0Fh 
    add bh,30h 
    cmp bh,39h
    jc print1
    add bh,07h
    print1:
    mov ah,02h
    mov dl,bh
    int 21h
    
    mov bx,A
    and bl,0F0h
    ror bl,04h 
    add bl,30h 
    cmp bl,39h
    jc skip
    add bl,07h
    skip:
    mov ah,02h
    mov dl,bl
    int 21h 
    
    mov bx,A
    and bl,0Fh 
    add bl,30h 
    cmp bl,39h
    jc skip1
    add bl,07h
    skip1:
    mov ah,02h
    mov dl,bl
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

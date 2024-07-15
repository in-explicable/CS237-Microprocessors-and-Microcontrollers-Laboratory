; multi-segment executable file template.

data segment
    ; add your data here!
    array dw 1233h,3457h,3560h,5430h,3232h 
    even2 dw 0,0,0,0,0,0
    even1 dw 0 
    odd_count dw 0
    avg dw ?
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
    mov cx,5
    lea si,array
    lea di,even2
    loop1:
    mov ax,[si]
    shr ax,1
    jnc even
    add dx,[si]
    inc odd_count
    inc si
    inc si
    loop loop1
    jmp next
    
    
    
    even:
    mov ax,[si]
    mov [di],ax
    inc si
    inc si
    inc di 
    inc di
    inc even1
    loop loop1
    
    
    next:
    mov ax,dx
    mov dx,0
    mov bx,odd_count
    div bx        
    mov avg,ax
    
    lea si,even2
    lea di,even2
    inc di
    inc di
    mov cx,even1
    loop2:
      
    ; Compare and swap if needed
    mov ax, [si]
    cmp ax, [di]
    jg  no_swap

    
    xchg ax, [di]
    mov [si], ax

    no_swap:
     
    add si, 2
    add di, 2

    ; Check for the end of the array
   loop loop2
                   
    
    lea si,even2
    mov cl,03h 
    display:
    
    mov bx,[si]       ;For each digit, perform hex to ASCII 
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
    
    mov bx,[si]
    and bh,0Fh 
    add bh,30h 
    cmp bh,39h
    jc print1
    add bh,07h
    print1:
    mov ah,02h
    mov dl,bh
    int 21h
    
    mov bx,[si]
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
    
    mov bx,[si]
    and bl,0Fh 
    add bl,30h 
    cmp bl,39h
    jc skip1
    add bl,07h
    skip1:
    mov ah,02h
    mov dl,bl
    int 21h
    
    mov ah,02h
    mov dl,09h
    int 21h
    inc si
    loop display
    
ends

end start ; set entry point and stop the assembler.

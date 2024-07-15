; multi-segment executable file template.

data segment    
    array dw 0505h, 0ABCDh, 0FFFFh
    count db 03h 
    zero_count db ?
    one_count db ?
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    lea si, array    
    mov bl,count
    loop1:    
    mov ax,[si] 
    mov cx,16         ;inner loop should run for 16 times (16 bits)
    
    mov zero_count, 0 
    mov one_count, 0
    
    loop2:
    shr ax, 01h
    jc one
    inc zero_count 
    jmp skip
    one:
    inc one_count
    skip:
    loop loop2 
    dec bl            ;dec the count stored in bl
    mov count,bl      
    mov al, one_count
    call print        ;call the print proc which converts hex to ascii and displays it
    inc si
    inc si
    mov bl, 0  
    add bl, count     ;check if count is 0
    jnz loop1         ;outer loop should run for 'count' times
    
    mov ax, 4c00h     ; exit to operating system.
    int 21h  
    
print proc
    mov AH, 00H
    mov AH, AL
    AND AH, 0F0H
    mov CL, 04h
    ROR AH, CL 
    add AH, 30H 
    cmp AH, 39H
    JLE A
    add AH, 07h
A: 
    mov BH, AH
    AND AL, 0FH
    ADD AL, 30H
    CMP AL, 39H
    JLE B
    ADD AL, 07H
B:  
    mov bx,ax    
    mov dl,bh 
    mov ah,2
    int 21h 
    
    mov dl,bl
    mov ah,2
    int 21h   
    
    mov dl,9          ;for tab space
    mov ah,2
    int 21h
ret
print endp    
  
ends

end start ; set entry point and stop the assembler.

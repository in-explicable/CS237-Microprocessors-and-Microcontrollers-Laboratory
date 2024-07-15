;sum of squares of the number

data segment
    arr db 1,2,3,4,5
    res db ?
ends

code segment
    assume cs:code,ds:data
start:    
    mov ax,data
    mov ds,ax
    mov es,ax
    mov dx,00h
    mov ah,00h
    mov cl,05h
    
    lea si,arr
sqr:    
    mov al,[si]
    mov bl,al
    mul bl
    
    add dl,al
    inc si
    dec cl
    jnz sqr
    
    mov res,dl
    
    mov ax,04ch
    int 21h
ends
end start
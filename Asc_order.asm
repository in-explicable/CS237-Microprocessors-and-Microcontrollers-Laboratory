data segment
    arr1 db 2,7,1,5,3 
    msg0 db 32,'$'
    msg1 db 'Input : $'
    msg2 db 10,13,'Output : $'
ends

code segment

start:    
    mov ax,data
    mov ds,ax
    mov es,ax
    
    ;To print msg1 "Input:"
    mov ah,09h
    lea dx,msg1
    int 21h
    
    ;To print arr1 one by one
    lea si,arr1
    mov cx,05h
    repeat:   
    mov bl,[si]
    add bl,30h
    mov ah,02h
    mov dl,bl
    int 21h
    inc si
    mov ah,09h    ;For space between numbers
    lea dx,msg0
    int 21h
    loop repeat
    
    
    ;Ascending Sort
    mov ch,05h
    back2:
    mov cl,05h
    mov si,offset arr1
    back1: 
    mov al,[si]
    mov ah,[si+1]
    cmp al,ah
    jc skip
    jz skip
    mov [si+1],al
    mov [si],ah
    skip:
    inc si
    dec cl
    jnz back1
    dec ch
    jnz back2
    
    ;To print msg2 "output:"
    mov ah,09h
    lea dx,msg2
    int 21h
    
    ;To print sorted arr1 one by one
    lea si,arr1
    mov cx,05h
    repeat1:   
    mov bl,[si]
    add bl,30h
    mov ah,02h
    mov dl,bl
    int 21h
    inc si  
    mov ah,09h
    lea dx,msg0   ;For space between numbers
    int 21h
    loop repeat1
    
    
       
    mov ah,04ch
    int 21h
ends
end start
; multi-segment executable file template.
; Count the uppercase, lowercase and special characters in a string

data segment         
    string db "nImmAAl3215@#!:$"   
    msg1 db "Special:$"
    msg2 db 0dh,0ah,"Numbers:$"
    msg3 db 0dh,0ah,"Uppercase:$"
    msg4 db 0dh,0ah,"Lowercase:$"
   
    count db 15       
    spl db 00h
    uppercase db 00h
    lowercase db 00h 
    num db 00h
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    lea si, string
    mov cl, count
    
    repeat:
    cmp [si],'0'
    jc S
    cmp [si],'9'
    jnc uc
    inc num
    jmp skip
    
    uc:
    cmp [si],'A'
    jc S
    cmp [si],'Z'
    jnc lc
    inc uppercase
    jmp skip
    
    lc:
    cmp [si],'a'
    jc S
    cmp [si],'z'
    jnc S
    inc lowercase
    jmp skip
     
    S:
    inc spl
    
    skip: 
    inc si              
    loop repeat         
    
    mov dx,offset msg1
    mov ah,09h
    int 21h
    
    mov ah,02h
    add spl,30h
    mov dl, spl
    int 21h  
    
    mov dx,offset msg2
    mov ah,09h
    int 21h
    
    mov ah,02h
    add num,30h  
    mov dl,num
    int 21h   
    
    mov dx,offset msg3
    mov ah,09h
    int 21h
    
 
    mov ah,02h
    add uppercase,30h  
    mov dl,uppercase
    int 21h         
    
    mov dx,offset msg4
    mov ah,09h
    int 21h
    
    
    mov ah,02h      
    add lowercase,30h
    mov dl,lowercase
    int 21h
    
    mov ah, 4ch ; exit to operating system.
    int 21h    
ends

end start
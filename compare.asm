; multi-segment executable file template.

data segment

str1 db "hello hi $"  
str2 db "hello how$"   
str3 db 09h dup(?)
length db 00h    
ends                

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov ax,extra
    mov es, ax

    lea si,str1
    mov bx,offset str2
    lea di,str3
       
    mov cl,7 
    
 looping:
    cmp cl,00h
    jz end
    mov al,[si]
    mov dl,[bx]  
     
    cmp  al,dl 
    jz save
    jnz end
    inc si 
    inc di
    loop looping
save:          
    mov [di],al
    inc bx
    inc di
    inc si     
    inc length
    jmp looping 
 
end:   
 
 lea si, str3
 mov cl,length
 repeat:
 mov al,[si]
 mov ah,2 
 mov dl,al
 int 21h  
 inc si 
 loop repeat 

     
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

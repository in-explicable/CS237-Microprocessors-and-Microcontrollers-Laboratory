; multi-segment executable file template.

data segment                  
    uppercase db "ABCDEGT$"
    lowercase db 04h dup(?)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    lea si,uppercase
    lea di,lowercase               
    mov cl,07h
    
    repeat:
    mov al,[si] 
    add al,20h
    mov [di],al
    inc si
    inc di              
    loop repeat
    
    lea di,lowercase
    mov cl,07h
    repeat1:
    mov ah,02h
    mov dl,[di]
    int 21h
    inc di
    loop repeat1
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

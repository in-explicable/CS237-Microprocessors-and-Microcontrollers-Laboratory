; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    array1 db 12h,33h,44h,55h,76h
    array2 db 34h,5h,78h,56h,77h 
    temp db ?
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
    lea si, array1
    lea di, temp
    mov cx, 05h   
    cld
    rep movsb
    
    lea si, array2
    lea di, array1    
    mov cx, 05h 
    cld
    rep movsb
    
    lea si, temp
    lea di, array2
    mov cx, 05h 
    cld
    rep movsb
                  
                  
   
    mov dx, offset pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

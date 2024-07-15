; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"   
    array db 0FFh, 10h, 0h, 20h, 0F1h
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
    lea si, array
    mov cx, 05h
    
    repeat:
    mov al, 0
    add al, [si]
    jz zero
    rol al, 01h
    jnc positive
    inc bl ;Count negative numbers
    jmp next
    positive:
    inc bh  ;Count positive numbers
    jmp next
    zero:
    inc dh  ;Count zero
    next:
    inc si 
    loop repeat
    
           
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
      
      Whatever you write here does not matter :)
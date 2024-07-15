;Name:Nivesh S, Reg No:21EC1063

;multi-segment executable file template.
data segment
 array dw 0F04h,568h,808h,3406h
 largest_num dw ? 
 
ends                       

code segment
assume cs:code, ds:data
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    lea si,array
    mov cl,04h
    mov ax,[si]
    
    again:
    cmp ax,[si+2]
    jnl next
    mov ax,[si+2]
    next:
    inc si
    inc si
    loop again
    mov largest_num,ax
  
    mov ax, 4c00h ; exit to operating system.
    int 21h 
ends
end start ; set entry point and stop the assembler

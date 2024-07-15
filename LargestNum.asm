;Name:Nivesh S, Reg No:21EC1063

;multi-segment executable file template.
data segment
 array DB 51h,0Ah,78h,7Fh,34h
 largest_num db ? 
 
ends
stack segment
 dw 128 dup(0)
ends
code segment
assume cs:code, ds:data
start:
; set segment registers:
 mov ax, data
 mov ds, ax
 mov es, ax
; add your code here
 
 mov cx, 05h    
 mov bl, 00h    
 lea SI, array
    up:
     mov al, [SI]
     cmp al, bl
     jl nxt       ; jump if less than
     mov bl, al 
     
    nxt:
        inc si
        
    loop up
 mov largest_num,bl
  
 mov ax, 4c00h ; exit to operating system.
 int 21h 
ends
end start ; set entry point and stop the assembler

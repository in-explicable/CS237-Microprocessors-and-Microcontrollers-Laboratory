;Name:Nivesh S, Reg No:21EC1063

; multi-segment executable file template.
data segment
 ; add your data here!
    array db 76h,0FFh,67h,78h,47h             
    min db ?
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    ; add your code here
 
    mov cx, 04h
    lea si, array 
    mov al,[si]
up:      
    mov ah, [si+1]
    cmp al, ah
    jc nxt
    mov al, ah     ;al will store the min value
nxt:
    inc si
    loop up

    mov min,al
 

    mov ax, 4c00h ; exit to operating system.
    int 21h 
ends
end start ; set entry point and stop the assembler.
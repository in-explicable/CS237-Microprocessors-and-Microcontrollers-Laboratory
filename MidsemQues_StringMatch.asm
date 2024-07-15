;Name: Nivesh.S, Reg No: 21EC1063
;Comparing Two Strings
; multi-segment executable file template.

data segment
    ; add your data here!
    string1 db "hello world $"
    string2 db "hello $"
    msg1 db 0ah,0dh,"Equal $"
    msg2 db 0ah,0dh,"Not equal $"
    msg3 db "Length = $" 
    length db 00h
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
    cld
    lea si, string1
    lea di, string2 
    mov cx,11
    repeat:
    mov ax, [si]
    mov bx, [di]
    cmp ax, bx
    jz equal
    jmp B
    equal:
    mov ah,02h
    mov al, [si]
    mov dl,al
    int 21h
    inc length
    inc si
    inc di
    loop repeat
    
    A:
    mov dx, offset msg1
    mov ah, 9
    int 21h   
    jmp C
    
    B:
    mov dx, offset msg2
    mov ah, 9
    int 21h
    
    C:   
    mov dx, offset msg3
    mov ah, 9
    int 21h
    mov al, length
    add al, 30h
    mov ah, 2
    mov dl, al
    int 21h
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

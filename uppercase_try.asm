; multi-segment executable file template.
; Uppercase and lowercase

data segment         
    string db "@"       
    spl_count db ?
    uppercase_count db ?
    lowercase_count db ? 
    num_count db ?
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    lea si, string
    mov cl, 1
    repeat:
    mov al,[si] 
    cmp al,'0'
    jc spl  
    cmp al,'9'
    jnc spl
    inc num_count
    jmp skip 
    UPPER:
    cmp al,'Z'
    jnc LOWER
    inc uppercase_count
    jmp skip
    LOWER:
    inc lowercase_count
    jmp skip
    spl:   
    cmp al,'@'
    jc UPPER
    inc spl_count
    skip:
    inc si
    loop repeat
        
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

; multi-segment executable file template.
; Count the uppercase, lowercase and special characters in a string

data segment         
    string db "@$%862yuiHJ'=+}"
    count db 15       
    spl db ?
    uppercase db ?
    lowercase db ? 
    num db ?
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
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

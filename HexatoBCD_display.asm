;Name: Nivesh S, Reg No: 21EC1063

data segment 
  hex dw 800
  bcd dw ?
ends

code segment
start:
  mov ax,data
  mov ds,ax
  mov es,ax
  
  mov bx, 0000h
  mov dh, 00h
  
  mov ax, hex
  
  compare1:
    cmp ax, 10000
    jl compare2
    sub ax,10000
    add dh,1
    jmp compare1

  compare2:
    cmp ax, 1000
    jl compare3
    sub ax, 1000
    add bx, 1000h
    jmp compare2

  compare3:
    cmp ax, 100
    jl compare4
    sub ax, 100
    add bx, 100h
    jmp compare3
  
  compare4:
    cmp ax, 10
    jl final
    sub ax, 10
    add bx, 10h
    jmp compare4

  final:
    add bx,ax  
    mov bcd,bx
    
    mov bx,bcd
    and bh,0F0h
    mov cl,04h
    ror bh,04h 
    add bh,30h
    mov ah,02h
    mov dl,bh
    int 21h
    
    mov bx,bcd
    and bh,0Fh
    add bh,30h
    mov ah,02h 
    mov dl,bh
    int 21h      
    
    mov bx,bcd
    and bl,0F0h
    mov cl,04h
    ror bl,04h 
    add bl,30h
    mov ah,02h
    mov dl,bl
    int 21h
    
    mov bx,bcd
    and bl,0Fh
    add bl,30h
    mov ah,02h 
    mov dl,bl
    int 21h
    
    
    
    mov ax,4c00h
    int 21h
ends  
end start
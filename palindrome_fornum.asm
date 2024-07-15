data segment
    ar1 db 11h,11h,13h,11h,11h
    msg1 db "Not Palindrome$"
    msg2 db "Palindrome$"  
    count db 05h
data ends

extra segment
    ar2 db 05h dup(?)
extra ends

code segment
    assume cs:code,ds:data,es:extra
    
start: mov ax,data
       mov ds,ax
       mov ax,extra
       mov es,ax 
       lea si,ar1
       lea di,ar2+04h
       mov cl,count
    
store: mov al,[si]
       inc si
       mov [di],al
       dec di
       loop store
 
      lea si,ar1
      lea di,ar2 
      mov cl,count
check:mov al,ds:[si]
      mov bl,es:[di]
      cmp al,bl
      jnz no   
      inc si
      inc di
      loop check 
      
      mov dx,offset msg2
      mov ah,09h
      int 21h
      jmp do
      
no:   mov dx,offset msg1
      mov ah,09h
      int 21h
      jmp do
                 
do:   mov ah,4ch
      int 21h
code ends
 end start
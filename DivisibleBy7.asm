data segment
    arr db 15h,11h,07h,14h,23h
    count db 00h
    sum db 00h   
    msg1 db "NO. of elements:$"
data ends

code segment
    assume cs:code,ds:data
    
start:
        mov ax,data
        mov ds,ax
        lea si,arr
        mov cl,05h
        
check: mov ax,0000h
       mov al,[si]
       mov bl,07h
       div bl
       add ah,00h
       jz divisible
       jmp do
       
       
divisible: inc count
           mov al,[si]
           add sum,al
          
do: inc si       
    loop check                 
    
    mov dx,offset msg1
    mov ah,09h
    int 21h
    
    mov ah,02h 
    add count,30h
    mov dl,count
    int 21h 

mov ah,4ch
int 21h

code ends
end start
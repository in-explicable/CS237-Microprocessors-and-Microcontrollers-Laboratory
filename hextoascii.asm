;Name: Nivesh S, Reg.No:21EC1063
;Ascii to hexa

Data segment
 Ascii DW ?
 Hexa DB 9Eh
Data ends

code segment
 Assume Ds: data, cs: code
Start: 
 mov Ax, data
 mov DS, AX
 
 mov AH, 00H
 mov AL, Hexa
 mov AH, AL
 AND AH, 0F0H
 mov CL, 04h
 ROR AH, CL 
 add AH, 30H 
 cmp AH, 39H
 JLE A
 add AH, 07h
A: 
 mov BH, AH
 AND AL, 0FH
 ADD AL, 30H
 CMP AL, 39H
 JLE B
 ADD AL, 07H
B: 
 Mov CL, AL
 ADD BX, CX 
 mov Ascii, BX 
 mov dl,bh
 mov ah,2
 int 21h
 
 mov dl,bl
 mov ah,2
 int 21h
 mov AH, 4CH
 int 21H
ends
end start
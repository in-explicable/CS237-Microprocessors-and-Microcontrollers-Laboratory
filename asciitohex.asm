;Name: Nimal Vardhan M, Reg.No:21EC1060
;Ascii to hexa

Data segment
 Ascii DW 3130H
 Hexa DB ?
Data ends

code segment
 Assume Ds: data, cs: code
Start: 
 mov Ax, data
 mov DS, AX
 mov AX, ASCII
 mov BX, AX
 AND BX, 0FF00H
 mov CL, 08h
 ROR BX, CL 
 sub BL, 30H 

 cmp BL, 09H
 JLE A
 SUB BL, 07h
A: 
 mov DH, BL
 mov CL, 04H
 ROR DH, CL
 mov BX, AX
 AND BX, 00FFH
 SUB BL, 30h
 CMP BL, 09H
 JLE B
 SUB BL, 07H
B: 
 Mov DL, BL
 ADD DH, DL 
 mov Hexa, DH

ends
end start
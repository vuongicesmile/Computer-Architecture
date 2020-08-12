.MODEL SMALL
.STACK 100h
.DATA
 
    TB DB 10,13, 'TAT CA CHU HOA: $'
 
.CODE
    ; Lay du lieu tu DATA vao DS
    MOV AX, @DATA
    MOV DS, AX

INPUT:               
    
    ; Xuat thong bao
    MOV AH, 9
    LEA DX, TB
    INT 21h
    
    ; LAP DE XUAT TOAN BO KI TU HOA TRONG MA ASCII
    MOV CX, 26
    MOV DL, 'A'
    
    PRINT:
        MOV AH, 2
        INT 21h
        INC DL
        LOOP PRINT
           
    ; Thoat chuong trinh
    MOV AH, 4Ch
    INT 21h
END


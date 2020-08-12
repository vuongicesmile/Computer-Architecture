.MODEL SMALL
.STACK 100h
.DATA
 
    TB DB 10,13, 'Nhap mot ki tu: $'
    TB2 DB 10,13, '5 ki tu ke tiep: $'
    
    SO DB ?
.CODE
    ; Lay du lieu tu DATA vao DS
    MOV AX, @DATA
    MOV DS, AX


    ; Xuat thong bao nhap ki tu
    MOV AH, 9
    LEA DX, TB
    INT 21h
    
    ; Nhap mot ki tu
    MOV AH, 1
    INT 21h
    
    MOV SO, AL
    
    ; Xuat thong bao ket qua
    MOV AH, 9
    LEA DX, TB2
    INT 21h
    
    ; Xuat 5 ki tu
    MOV CX, 5
    
    PRINT:
        INC SO 
        
        MOV AH, 2 
        MOV DL, SO
        INT 21h
        
        MOV DL, 0Ah
        INT 21h
        
        LOOP PRINT

    ; Thoat chuong trinh
    MOV AH, 4Ch
    INT 21h
END


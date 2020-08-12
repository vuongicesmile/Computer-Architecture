.MODEL SMALL
.STACK 100h
.DATA
 
    TB1 DB 10,13, 'Nhap vao 1 ki tu: $'
    TB2 DB 10,13, '5 ki tu dung truoc: $'
    
    SO DB ?
.CODE
    ; Lay du lieu tu DATA vao DS
    MOV AX, @DATA
    MOV DS, AX
    
    ; Xuat thong bao nhap 1 ki tu
    MOV AH, 9
    LEA DX, TB1
    INT 21h
    
    ; Nhap 1 ki tu
    MOV AH, 1
    INT 21h
    
    MOV SO, AL
    
    ; Xuat thong bao ket qua
    MOV AH, 9
    LEA DX, TB2
    INT 21h
    
    SUB SO, 5    
    MOV CX, 5
    
    PRINT:        
        MOV AH, 2
        MOV DL, SO
        INT 21h
                  
        MOV DL, 0Ah
        INT 21h 
         
        INC SO
        
        LOOP PRINT
           
    ; Thoat chuong trinh
    MOV AH, 4Ch
    INT 21h
END


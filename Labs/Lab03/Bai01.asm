.MODEL SMALL
.STACK 100h
.DATA
    TB1 DB 10,13, 'Bay gio la sang, chieu hay toi? $'
    KQ1 DB 10,13, 'Chao buoi sang!$'
    KQ2 DB 10,13, 'Chao buoi chieu!$'
    KQ3 DB 10,13, 'Chao buoi toi!$'

.CODE
    ; Lay du lieu tu DATA vao DS
    MOV AX, @DATA
    MOV DS, AX

INPUT:
    ; Thong bao nhap 1 ki tu
    MOV AH, 9
    LEA DX, TB1
    INT 21h           
    
    ; Nhap 1 ki tu
    MOV AH, 1
    INT 21h 
    
    ; So sanh 
    CMP AL, 'S'
    JE SANG
    CMP AL, 's'
    JE SANG
    
    CMP AL, 'C'
    JE TRUA
    CMP AL, 'c'
    JE TRUA
    
    CMP AL, 'T'
    JE TOI
    CMP AL, 't'
    JE TOI 
    
    JMP INPUT
    
SANG:
    MOV AH, 9
    LEA DX, KQ1
    INT 21h
    
    JMP EXIT
    
TRUA:
    MOV AH, 9
    LEA DX, KQ2
    INT 21h
    
    JMP EXIT
    
TOI:    
    MOV AH, 9
    LEA DX, KQ3
    INT 21h
    
    JMP EXIT
    
EXIT:           
    ; Thoat chuong trinh
    MOV AH, 4Ch
    INT 21h
END


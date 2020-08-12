.MODEL SMALL
.STACK 100h
.DATA
    TBKhac DB 10,13, 'Ky tu nhap khac chu/so$'
    TBChu  DB 10,13, 'Ky tu nhap la chu!$'
    TBSo   DB 10,13, 'Ky tu nhap la so!$' 
    
    TB     DB 10,13, 'Nhap vao 1 ki tu: $'
    
.CODE
    ; Lay du lieu tu DATA vao DS
    MOV AX, @DATA
    MOV DS, AX
    
    ; Hien thi dong thong bao nhap
    MOV AH, 9
    LEA DX, TB
    INT 21h
    
    ; Nhap ki tu
    MOV AH, 1
    INT 21h
    
    CMP AL, '0'
    JB KHAC
    CMP AL, '9'
    JBE SO
    CMP AL, 'A'
    JB KHAC
    CMP AL, 'Z'
    JBE CHU
    CMP AL, 'a'
    JB KHAC
    CMP AL, 'z'
    JB CHU
    
    JMP KHAC
    
KHAC:
    MOV AH, 9
    LEA DX, TBKhac
    INT 21h
    
    JMP EXIT  
    
CHU:
    MOV AH, 9
    LEA DX, TBChu
    INT 21h
    
    JMP EXIT
    
SO: 
    MOV AH, 9
    LEA DX, TBSo
    INT 21h
    
    JMP EXIT

EXIT:              
    ; Thoat chuong trinh
    MOV AH, 4Ch
    INT 21h
END


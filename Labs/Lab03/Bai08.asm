.MODEL SMALL
.STACK 100h
.DATA
    END1 DB 10,13, 'Bam phim bat ki de thoat...$'
    MSG1 DB 10,13, 'Hay nhap vao 1 chu thuong: $'
    MSG2 DB 10,13, 'Chu hoa tuong ung la: $'
    
    KYTU DB ?
.CODE
    ; Lay du lieu tu DATA vao DS
    MOV AX, @DATA
    MOV DS, AX
    
INPUT:    
    ; Xuat thong bao nhap 1 ki tu
    MOV AH, 9
    LEA DX, MSG1
    INT 21h
    
    ; Nhap 1 ki tu nhung khong hien thi len man hinh
    MOV AH, 7
    INT 21h
    
    CMP AL, 'a'
    JB INPUT
    CMP AL, 'z'
    JA INPUT
    
    MOV KYTU, AL
    
    ; Xuat thong bao ket qua
    MOV AH, 9
    LEA DX, MSG2
    INT 21h
    
    ; Xuat ki tu hoa tuong ung
    MOV DL, KYTU
    SUB DL, 20h
    MOV AH, 2
    INT 21h
        
    
    ; Thoat chuong trinh
    MOV AH, 9
    LEA DX, END1
    INT 21h
    
    MOV AH, 7
    INT 21h
    
    MOV AH, 4Ch
    INT 21h
END

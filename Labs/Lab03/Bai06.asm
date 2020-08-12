.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB 10,13, 'Nhap mot ky tu: $'
    MSG2 DB 10,13, 'Nam ky tu dung truoc: $'
    MSG3 DB 10,13, 'Nam ky tu dung sau: $'
    
    KYTU DB ?
    
.CODE
    ; Lay du lieu tu DATA vao DS
    MOV AX, @DATA
    MOV DS, AX
    
           
    ; Xuat thong bao nhap 1 ki tu
    MOV AH, 9
    LEA DX, MSG1
    INT 21h
    
    ; Nhap 1 ki tu
    MOV AH, 1
    INT 21h
    MOV KYTU, AL
    
    ; Xuat thong bao 5 ki tu dung truoc
    MOV AH, 9
    LEA DX, MSG2
    INT 21h
    
    ; Ki tu dung truoc dau tien
    MOV DL, KYTU
    SUB DL, 5
    MOV CX, 5
    
    MOV AH, 2
    PRINT_PRE:
        INT 21h
        INC DL
        LOOP PRINT_PRE

    ; Xuat thong bao 5 ki tu dung sau
    MOV AH, 9
    LEA DX, MSG3
    INT 21h
    
    ; Ki tu dung lien ke sau
    MOV DL, KYTU
    INC DL
    MOV CX, 5
    
    MOV AH, 2        
    PRINT_POS:
        INT 21h
        INC DL
        LOOP PRINT_POS           
           
    ; Thoat chuong trinh
    MOV AH, 4Ch
    INT 21h

END


.MODEL SMALL
.STACK 100h
.DATA

    MSG1 DB 10,13, 'Nhap vao 1 day nhi phan: $'
    MSG2 DB 10,13, 'Day nhi phan vua nhap la: $'
    ERR1 DB 10,13, 'Nhap sai! Nhap lai toan bo di, ahihi$'
    ERR2 DB 10,13, 'Da du 16 bit!$'
    END1 DB 10,13, 'Bam phim bat ki de thoat chuong trinh...$'

.CODE
    ; LAY DU LIEU TU DATA VAO DS
    MOV AX, @DATA
    MOV DS, AX    
    ; =========================================
    
    ; Khoi tao gia tri
    RESET:  
        XOR BX, BX
        XOR CX, CX
        
        ; Xuat thong bao nhap day nhi phan
        MOV AH, 9
        LEA DX, MSG2
        INT 21h
    
    INPUT:
        ; Nhap 1 ki tu
        MOV AH, 7
        INT 21h
        
        ; Kiem tra ENTER => Hien thi day nhi phan
        CMP AL, 0Dh
        JE BREAK
        
        CMP AL, '0'
        JE XULY
        CMP AL, '1'
        JE XULY
        
        ; Nguoi dung nhap sai
        MOV AH, 9
        LEA DX, ERR1
        INT 21h
        JMP RESET
        
        ; Nguoi dung nhap dung => Xu ly ket qua
        XULY:
            MOV AH, 2
            MOV DL, AL
            INT 21h
            
            AND AL, 0Fh
            SHL BX, 1
            OR BL, AL
            
            INC CX ; Tang bien dem len 1 don vi
            
        CONTINUE:
            CMP CX, 16 ; Kiem tra nhap du 16 ki tu hay chua
            JB INPUT
        
        ; Xuat thong bao da nhap du 16 ki tu
        MOV AH, 9
        LEA DX, ERR2
        INT 21h 
    
    BREAK:
        ; Xuat thong bao ket qua
        MOV AH, 9
        LEA DX, MSG2
        INT 21h
        
        MOV CX, 16
        
        ; Xuat chuoi nhi phan
        PRINT:
            ROL BX, 1
            JNC PRINT_0
            JC PRINT_1
            
            PRINT_0:
                MOV AH, 2
                MOV DL, '0'
                INT 21h
                JMP CONTINUE1
                
            PRINT_1:
                MOV AH, 2
                MOV DL, '1'
                INT 21h
                
            CONTINUE1:    
                LOOP PRINT
    
    ; =========================================
    ; DUNG MAN HINH, XEM KET QUA
    MOV AH, 9
    LEA DX, END1
    INT 21h
    
    MOV AH, 7
    INT 21h
    
    ; THOAT CHUONG TRINH
    MOV AH, 4Ch
    INT 21h
    
END
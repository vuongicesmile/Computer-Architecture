.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB 10,13, 'Nhap vao 1 ki tu: $'
    RES1 DB 10,13, 'Ki tu da nhap la chu! $'
    RES2 DB 10,13, 'Ki tu da nhap la so! $'
    RES3 DB 10,13, 'Ki tu da nhap khac chu/ so! $'
    END1 DB 10,13, 'Bam phim bat ki de thoat...!$'
  
.CODE
    ; Lay du lieu tu DATA vao DS
    MOV AX, @DATA
    MOV DS, AX
    
INPUT:    
    ; Thong bao nhap 1 ki tu
    MOV AH, 9
    LEA DX, MSG1
    INT 21h
    
    ; Nhap 1 ki tu
    MOV AH, 1
    INT 21h
     
    CMP AL, 1Bh ; => Phim ESC, thoat vong lap
    JE BREAK 
     
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
    JBE CHU
    
    KHAC:
        MOV AH, 9
        LEA DX, RES3
        INT 21h
        
        JMP CONTINUE
    
    CHU:
        MOV AH, 9
        LEA DX, RES1
        INT 21h
        
        JMP CONTINUE
        
    SO:
        MOV AH, 9
        LEA DX, RES2
        INT 21h
    
    CONTINUE:
        JMP INPUT
        
BREAK:                   
  
    ; Thoat chuong trinh
    CALL THOAT
    
    
    
    
    ; ============================================
    ; KHAI BAO THU TUC
    ; ============================================
        
    THOAT PROC
        MOV AH, 9
        LEA DX, END1
        INT 21h
        
        MOV AH, 7
        INT 21h
        
        MOV AH, 4Ch
        INT 21h
        RET
    THOAT ENDP
    
END

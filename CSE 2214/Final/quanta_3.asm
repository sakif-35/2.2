.MODEL SMALL
.STACK 100H
.DATA
    ENDL DB 0DH,0AH,'$'
    ARR DB 5 DUP (?)
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    XOR AX,AX
    MOV CX,5
    LEA SI, ARR
   
    
    INPUT:
        
        XOR AX,AX
        CALL INDEC
        CMP AX,BX
        JLE SKIP
        MOV BX,AX
        
    SKIP:    
    LOOP INPUT  
    
    
    MOV AX,BX
    CALL OUTDEC
    
    
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM
END MAIN
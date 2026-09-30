.MODEL SMALL
.STACK 100H
.DATA
    I DW ?
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    CALL INDEC
    MOV CX,AX
    MOV I,1
    MOV AX,1
    
    L:
    MUL I
    INC I
    CMP I,CX
    JLE L
         
    CALL OUTDEC
    
    
    MOV AH,4CH
    INT 21H 
    
    
    
MAIN ENDP
INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM
END MAIN
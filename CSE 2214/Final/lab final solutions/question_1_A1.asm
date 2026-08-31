.MODEL SMALL
.STACK 100H
.DATA
ENDL DB 0DH,0AH,'$'
MSG1 DB 'PRODUCT:$'
MSG2 DB 'COUNT:$'
ROW DW ?
ANS DW ?
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    XOR AX,AX
    CALL INDEC
    MOV ROW,AX  
    
    LEA DX,ENDL
    MOV AH,09H
    INT 21H 
    
    MOV CX,ROW
    PATTERN:
       ; MOV BX,CX
        MOV AX,01
        PRINT:
             CALL OUTDEC
             CMP AX,CX
             JE SKIP
             INC AX
        JMP PRINT
    SKIP: 
    LEA DX,ENDL
    MOV AH,09H
    INT 21H    
    LOOP PATTERN
    
    
    ;PRODUCT
    MOV CX,ROW
    MOV AX,01
    PRODUCT:
        MUL CX
    LOOP PRODUCT
    MOV ANS,AX
    
    LEA DX,ENDL
    MOV AH,09H
    INT 21H
    LEA DX,MSG1
    MOV AH,09H
    INT 21H
    XOR AX,AX
    MOV AX,ANS
    CALL OUTDEC 
    
    ;COUNT 1
    MOV CX,04
    MOV BX,0
    MOV DX,01
    COUNT:
        TEST AX,DX
        JZ SKIP_
        INC BX
    SKIP_:
    INC DX    
    LOOP COUNT
    
    LEA DX,ENDL
    MOV AH,09H
    INT 21H
    LEA DX,MSG2
    MOV AH,09H
    INT 21H
    XOR AX,AX
    MOV AX,BX
    CALL OUTDEC
      
            
    MOV AH,4CH
    INT 21H
            
MAIN ENDP
INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM
END MAIN
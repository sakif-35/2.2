.MODEL SMALL
.STACK 100H
.DATA

ENDL DB 0DH,0AH,'$'
MSG1 DB 'N:$'
MSG2 DB 'SUM:$'
MSG3 DB 'M:$'
ARR DW 100 DUP (?)
DIVISOR DB ?
N DW ?
SUM DW 0

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    XOR AX,AX
    CALL INDEC
    MOV N,AX
    
    LEA SI,ARR
    MOV CX,N
    INPUT:
        XOR AX,AX
        CALL INDEC
        MOV [SI],AX
        INC SI
        INC SI
    LOOP INPUT
    
    XOR AX,AX
    CALL INDEC
    MOV DIVISOR,AL 
    
    LEA SI,ARR
    MOV CX,N
    DIVIDE:
        XOR DX,DX
        MOV BX,[SI]
        
        MOV AX,[SI]
        DIV DIVISOR
        CMP AH,0H
        JNE SKIP_
        ADD SUM,BX
        LEA DX,ENDL
    MOV AH,09H
    INT 21H
        MOV AX,BX
        CALL OUTDEC
        SKIP_:
        INC SI
        INC SI
    LOOP DIVIDE
      
    LEA DX,ENDL
    MOV AH,09H
    INT 21H
    LEA DX,MSG2
    MOV AH,09H
    INT 21H
    XOR AX,AX
    MOV AX,SUM
    CALL OUTDEC
      
            
    MOV AH,4CH
    INT 21H
            
MAIN ENDP
INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM
END MAIN
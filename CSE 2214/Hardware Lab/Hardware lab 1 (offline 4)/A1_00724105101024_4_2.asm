;6. (4! + 3!) - 2! 

.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
    
    MOV BX,0
    
    MOV AX,4
    MOV CX,3
    L1:
        MUL CX
    LOOP L1    
    ADD BX,AX
    
    
    MOV AX,3
    MOV CX,2
    L2:
        MUL CX
    LOOP L2
    ADD BX,AX
    
    
    MOV AX,2
    MOV CX,1
    L3:
        MUL CX
    LOOP L3
    SUB BX,AX
    
    
    MOV AX,BX
    
    INT 3 
    
    
MAIN ENDP
END MAIN
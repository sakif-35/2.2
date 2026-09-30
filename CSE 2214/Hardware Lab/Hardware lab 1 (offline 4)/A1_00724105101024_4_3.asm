;8. Find out the average of the ten numbers.  

.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
 
 
    MOV AX,0
    MOV CX,10 
    L1:
        ADD AX,CX
    LOOP L1
    
    
    MOV BX,10
    MOV DX,0
    DIV BX
    
    
    INT 3
    
    
MAIN ENDP
END MAIN
;10. Floor size 80*80, Tiles size 4*4. How many tiles will be required to pave up the floor?  

.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
    
    MOV AX,80
    MOV BX,80
    MUL BX
    MOV CX,AX  ;CX = 80*80
             
             
    MOV AX,4
    MOV BX,4
    MUL BX
    MOV BX,AX  ;BX = 4*4
    
    
    MOV AX,CX
    MOV DX,0
    DIV BX
    
    INT 3
    
    
MAIN ENDP
END MAIN
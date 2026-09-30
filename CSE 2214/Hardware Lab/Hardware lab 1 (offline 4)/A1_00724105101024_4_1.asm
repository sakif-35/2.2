;2. Temperature conversion from F to C (110 F)  
; C = (F-32)*(5/9)

.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
    
    
    MOV AX,110
    SUB AX,32 
    
    MOV BX,5
    MUL BX
          
    MOV BX,9      
    DIV BX
    
    INT 3        
        
    
MAIN ENDP
END MAIN 
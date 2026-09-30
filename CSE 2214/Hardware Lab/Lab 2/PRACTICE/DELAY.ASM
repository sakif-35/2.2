MOV DX,2070H
L1:
    MOV AL,00111111B
    OUT DX,AL   
    
    CALL DELAY
    
    MOV AL,00000110B
    OUT DX,AL
    
    CALL DELAY
    
    JMP L1 
      
      
      
DELAY PROC
    MOV CX,20
    DEL:
    LOOP DEL
    RET
DELAY ENDP
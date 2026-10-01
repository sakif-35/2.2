; 00724105101017

.MODEL SMALL
.STACK 100H
.DATA 
    P1 DB 1000100B, 1000010B, 1111111B, 1000000B, 1000000B
    PA DB 1111110B, 0001001B, 0001001B, 0001001B, 1111110B
    P7 DB 0000001B, 1110001B, 0001001B, 0000101B, 0000011B
    PN DB 1111111B, 0000110B, 0011000B, 1100000B, 1111111B
    
    PATTERNS DW P1, PA, P7, PN
              
    K DB ?    
    PORT DW 2014H
    TARGET_PORT DW 2000H       

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
                
                
                
    MOV BX, 0
    MOV BX, -1D                
    
    REPEAT: 
        MOV CX, 20
        
        LEA SI, P1
        MOV DX, PORT
        
        WRITE:
            MOV AL, [SI]
            OUT DX, AL
            
            INC SI
            
            INC DX
                              
                        
            LOOP WRITE
        
        
        MOV AL, 00H
        OUT DX, AL 
                    
                           
        ADD PORT, BX 
        
                
        CMP BX, 1
        JNE CONTINUE
        
        MOV DX, PORT
        DEC DX
        MOV AL, 00H
        OUT DX, AL
        
        CONTINUE:
        
        ;CALL DELAY               
                     
                     
        MOV CX, TARGET_PORT                    
        CMP PORT, CX
        JE CHANGE_DIR
        JMP REPEAT  
        
        
CHANGE_DIR:        
        CMP BX, -1D
        JE GO_RIGHT
        JMP GO_LEFT
        

GO_RIGHT:
    MOV BX, 1D
    MOV TARGET_PORT, 2014H
    JMP REPEAT
        
        
              
GO_LEFT:
    MOV BX, -1D
    MOV TARGET_PORT, 2000H
    JMP REPEAT
        
          
          
          
DELAY PROC
    MOV K, 0
    L:
        INC K
        CMP K, 1
        JLE L
        
        RET
    
DELAY ENDP          
    
    
END MAIN
MAIN ENDP                   

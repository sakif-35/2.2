JMP START


NUM DW 54D
SAVE DW 0
DIGITS DB 0111111B, 0000110B, 1011011B, 1001111B, 1100110B, 1101101B, 1111101B, 0000111B, 1111111B, 1101111B

                                        
                                         
                                         
                                         
                                         
; MOV SI, OFFSET DIGIT          {OFFSET}

; DELAY ->
;          DELAY PROC
;               MOV CX, 100
;               L1: LOOP L1
;               RET
;          DELAY ENDP 
  




START:    

    MOV AX, NUM
    MOV SAVE, AX    

    REPEAT:
            
        ;STEP-1    
        XOR AX, AX
        XOR DX, DX
        
        MOV AX, NUM
        MOV BX, 100
        DIV BX
        
        MOV NUM, DX
          
        MOV SI, OFFSET DIGITS
        ADD SI, AX
        MOV AL, [SI]
        MOV DX, 2030H
        OUT DX, AL       
        
        
        ;STEP-2    
        XOR AX, AX
        XOR DX, DX
        
        MOV AX, NUM
        MOV BX, 10
        DIV BX
        
        MOV NUM, DX
          
        MOV SI, OFFSET DIGITS
        ADD SI, AX
        MOV AX, [SI]
        MOV DX, 2031H
        OUT DX, AL
        
        
        
        
        
        
        ;STEP-3       
        MOV SI, OFFSET DIGITS
        ADD SI, NUM
        MOV AL, [SI]
        MOV DX, 2032H
        OUT DX, AL               
               
               
                  
        CALL DELAY
               
        XOR AX, AX  
        XOR BX, BX  
        MOV AX, SAVE
        INC SAVE
        INC SAVE
        INC SAVE
        MOV BX, SAVE
        MOV NUM, BX
        
        INC AX 
        INC AX
        INC AX
        CMP AX, 999D
        JLE REPEAT
        
        
        



    DELAY PROC
        MOV CX, 200
        GO: LOOP GO
        RET          
                 
    DELAY ENDP                                     
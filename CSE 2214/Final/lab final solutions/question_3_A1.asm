.MODEL SMALL
.STACK 100H
.DATA
ENDL DB 0DH,0AH,'$'
V DB 'Not Consonant$'
C DB 'Consonant$'
;VOWEL DW a,e,i,o,u
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    XOR AX,AX
    MOV AH,01
    INT 21H
    MOV BL,AL
    
    CMP BL,'a'
    JE VOWEL_
    CMP BL,'e'
    JE VOWEL_
    CMP BL,'i'
    JE VOWEL_
    CMP BL,'o'
    JE VOWEL_
    CMP BL,'u'
    JE VOWEL_
    
    LEA DX,C
    MOV AH,09H
    INT 21H
    JMP LAST_
    
    VOWEL_:
    LEA DX,V
    MOV AH,09H
    INT 21H  
    
    LAST_:        
    MOV AH,4CH
    INT 21H
            
MAIN ENDP
INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM
END MAIN
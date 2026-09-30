JMP START
      
I DW 0 
INIT DW ?


START:  
    MOV BX, 11000000B 
    MOV INIT, BX
    L1: 
    
        XOR DX, DX
        XOR AX, AX
        
        MOV AX, BX
        MOV DX, 2070H
        OUT DX, AL
        
        CALL DELAY 
        
        SHR BX, 2
        CMP BX, 00000011B
        JE RESET 
        JMP L1
    RESET:
        XOR DX, DX
        XOR AX, AX
        
        MOV AX, BX
        MOV DX, 2070H
        OUT DX, AL
                    
                   
        MOV BX, INIT
        
        CALL DELAY
                          
        JMP L1              
        
        
        
        
DELAY PROC
    MOV I, 100
    L2:
        DEC I
        CMP I, 0
        JGE L2   
    
    RET   
    
DELAY ENDP 
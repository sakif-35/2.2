

L1:    
    MOV AL, 11000000B  
    NOT AL    ;goes to PORT A (which is dedicated to seven segment)    
    MOV DX, 2030H
    OUT DX, AL
      
     
       
    MOV AL, 11111001B  
    NOT AL    ;goes to PORT A (which is dedicated to seven segment)    
    MOV DX, 2030H
    OUT DX, AL        
    
    
      
    
    JMP L1

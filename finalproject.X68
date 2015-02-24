*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    LEA     MESSAGE,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    LEA     MESSAGE2,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    MOVE.B  #4,D0
    TRAP    #15
    
    LEA     MESSAGE3,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    MOVE.B  #4,D0
    TRAP    #15
    
    
* Put variables and constants here
        
CR      EQU     $0D
LF      EQU     $0A

MESSAGE DC.B    'WELCOME TO OUR DISSASSEMBLER!',CR,LF,0
MESSAGE2 DC.B    'Enter Starting Input Address: ',CR,LF,0
MESSAGE3 DC.B    'Enter Ending Input Address: ',CR,LF,0


    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

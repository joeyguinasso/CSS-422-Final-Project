*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:

*-----------------------------------------------------------
*START OF PROGRAM
*PRINT BANNER & WELCOME
*ASK USER FOR INPUT
*-----------------------------------------------------------

    LEA     BANNER,A1      *Print Welcome Message
    MOVE.B  #14,D0          
    TRAP    #15
    
    LEA     WELCOME,A1      *Print Welcome Message
    MOVE.B  #14,D0          
    TRAP    #15
    
    LEA     STARTADD,A1     *Print Input Message1
    MOVE.B  #14,D0
    TRAP    #15
    
    MOVE.B  #4,D0           *Store starting address at D2
    TRAP    #15
    MOVE.L  D1,D2
    JSR     CHECKSTART    
    
    LEA     ENDADD,A1     *Print Input Message2
    MOVE.B  #14,D0
    TRAP    #15
    
    MOVE.B  #4,D0           *Store ending address at D3
    TRAP    #15
    MOVE.L  D1,D3
    JSR     CHECKEND
    
*-----------------------------------------------------------
*CHECK INPUT ADDRESSES   
*-----------------------------------------------------------

CHECKSTART
    

CHECKEND





BitMask 
    MOVE    D5,-(A7)
    CLR     D5
    
Loop1    
    BSET    D6,D5
    ADD     #1,D6
    CMP     D7,D6
    BGT     BitMaskDone
    BRA     Loop1
    
BitMaskDone
    MOVE.L  D5,D6
    MOVE    (A7)+,D5
    RTS     
    
*BCHG/ANDI
OPC0000

*MOVE.B
OPC0001

*MOVE.L
OPC0010

*MOVE.W
OPC0011

*LEA/CLR/MOVEM/RTS/JSR
OPC0100

*ADDQ
OPC0101

*BCC
OPC0110

*MOVEQ
OPC0111

*DIVS
OPC1000

*SUB/SUBA
OPC1001

*EOR/CMP/CMPA
OPC1011

*MULS/AND
OPC1100

*ADD/ADDA
OPC1101

*LSL/LSR/ASL/ASR/ROL/ROR
OPC1110



* Put variables and constants here
        
CR          EQU     $0D
LF          EQU     $0A

WELCOME     DC.B       'WELCOME TO OUR DISSASSEMBLER!',CR,LF,0
STARTADD    DC.B       'Enter Starting Input Address:',CR,LF,0
ENDADD      DC.B       'Enter Ending Input Address:',CR,LF,0
BANNER      DC.B       '-----------------------------------------------',CR,LF
            DC.B       '   _   _   _   _   _   _   _   _   _   _   _',CR,LF
            DC.B       '  / \ / \ / \ / \ / \ / \ / \ / \ / \ / \ / \',CR,LF
            DC.B       ' ( R | A | I | N | B | O | W | F | I | S | H )',CR,LF
            DC.B       '  \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/',CR,LF,CR,LF
            DC.B       '-----------------------------------------------',CR,LF,0

    END    START        ; last line of source





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

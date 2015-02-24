*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    LEA     MESSAGE,A1      *Print Welcome Message
    MOVE.B  #14,D0          
    TRAP    #15
    
    LEA     MESSAGE2,A1     *Print Input Message1
    MOVE.B  #14,D0
    TRAP    #15
    
    MOVE.B  #4,A5           *Store starting address at A5
    TRAP    #15
    
    LEA     MESSAGE3,A1     *Print Input Message2
    MOVE.B  #14,D0
    TRAP    #15
    
    MOVE.B  #4,A6           *Store ending address at A6
    TRAP    #15
    
*********************************************************************

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
        
CR      EQU     $0D
LF      EQU     $0A

MESSAGE DC.B    'WELCOME TO OUR DISSASSEMBLER!',CR,LF,0
MESSAGE2 DC.B    'Enter Starting Input Address:',CR,LF,0
MESSAGE3 DC.B    'Enter Ending Input Address:',CR,LF,0


    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

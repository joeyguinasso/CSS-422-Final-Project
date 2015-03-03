*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:

BEGINNING   EQU $9000
END         EQU $90A0
OPCODE      EQU $400
DESTREG     EQU $410
DESTMODE    EQU $420
SOURCEREG   EQU $430
SOURCEMODE  EQU $440
     
*-----------------------------------------------------------
*START OF PROGRAM
*PRINT BANNER & WELCOME
*ASK USER FOR INPUT
*-----------------------------------------------------------


    MOVE.L  #%0001000111000000,$A750
    
    LEA     BANNER,A1      *Print Welcome Message
    MOVE.B  #14,D0          
    TRAP    #15
    
    LEA     WELCOME,A1      *Print Welcome Message
    MOVE.B  #14,D0          
    TRAP    #15
    
    LEA     STARTADD,A1     *Print Input Message1
    MOVE.B  #14,D0
    TRAP    #15
    
    LEA     BEGINNING,A1
    MOVE.B  #2,D0           *Store starting address at BEGINNING
    TRAP    #15
    JSR     CHECKSTART    
    
    LEA     ENDADD,A1     *Print Input Message2
    MOVE.B  #14,D0
    TRAP    #15
    
    LEA     END,A1
    MOVE.B  #2,D0           *Store ending address at END
    TRAP    #15
    JSR     CHECKEND
    
*-----------------------------------------------------------
*CHECK INPUT ADDRESSES   
*-----------------------------------------------------------

CHECKSTART
    RTS

CHECKEND
    RTS

*-----------------------------------------------------------
*GET OPCODE   
*-----------------------------------------------------------
    
    MOVE.L  BEGINNING,A1
    MOVE.L  (A1)+,D1            *NEED TO CONVERT FROM ASCII TO HEX
    MOVE.L  D1,D2
    JSR     MASKFIRST4
    JSR     OPCODECOMPARE
      
MASKFIRST4  
    AND.W   #%1111000000000000,D2
    ROL.W   #4,D2
    RTS     

MASKGETDESTREG
    AND.W   #%0000111000000000,D2
    ROR.W   #8,D2
    ROR.W   #1,D2
    RTS
    
MASKGETDESTMODE
    AND.W   #%0000000111000000,D2
    ROR.W   #6,D2
    RTS

OPCODECOMPARE
    CMP.B   #%0000,D2
    BEQ     OPC0000
    CMP.B   #%0001,D2
    BEQ     OPC0001
    CMP.B   #%0010,D2
    BEQ     OPC0010
    CMP.B   #%0011,D2
    BEQ     OPC0011
    CMP.B   #%0100,D2
    BEQ     OPC0100
    CMP.B   #%0101,D2
    BEQ     OPC0101
    CMP.B   #%0110,D2
    BEQ     OPC0110
    CMP.B   #%0111,D2
    BEQ     OPC0111
    CMP.B   #%1000,D2
    BEQ     OPC1000
    CMP.B   #%1001,D2
    BEQ     OPC1001
    CMP.B   #%1011,D2
    BEQ     OPC1011
    CMP.B   #%1100,D2
    BEQ     OPC1100
    CMP.B   #%1101,D2
    BEQ     OPC1101
    CMP.B   #%1110,D2
    BEQ     OPC1110
    CMP.B   #%0000,D2
    BEQ     OPC0000
    
DESTCOMPARE
    
    CMP.B   #%000,D4
    
    
    
    
*BCHG/ANDI
OPC0000

*MOVE.B
OPC0001
    
    LEA     MOVEMSG,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    LEA     OPCODE,A2
    MOVE.B  D2,(A2)
    JSR     MASKGETDESTREG      *RETRIEVE DESTINATION REGISTER
    MOVE.W  D2,D3               *STORE IN D3
    MOVE.W  D1,D2
    JSR     MASKGETDESTMODE     *RETREIVE DESTINATION MODE
    MOVE.W  D2,D4
    

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
MOVEMSG     DC.B       'MOVE.B',0
            
*BitMask 
 *   MOVE    D5,-(A7)
  *  CLR     D5
    
*Loop1    
 *   BSET    D6,D5
  *  ADD     #1,D6
   * CMP     D7,D6
    *BGT     BitMaskDone
    *BRA     Loop1
    
*BitMaskDone
 *   MOVE.L  D5,D6
  *  MOVE    (A7)+,D5
   * RTS     


    END    START        ; last line of source






*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

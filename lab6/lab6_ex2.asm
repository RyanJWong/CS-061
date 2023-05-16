;=================================================
; Name: Ryan Wong
; Email: rwong098@ucr.edu
; 
; Lab: lab 6, ex 2
; Lab section: 
; TA: 
; 
;=================================================
.ORIG x3000
    LD R3, BASE
    LD R4, MAX
    LD R5, BASE ; TOS
    
    LD R2, POP
    JSRR R2
    
    LD R2, PUSH
    
    LD R1, DEC_1
    JSRR R2
    
    LD R1, DEC_2
    JSRR R2
    
    LD R1, DEC_3
    JSRR R2
    
    LD R1, DEC_4
    JSRR R2
    
    LD R1, DEC_5
    JSRR R2
    
    LD R1, DEC_1
    JSRR R2
    
    LD R2, POP
    JSRR R2
    
HALT
    PUSH    .FILL x3200
    POP     .FILL x3400
    
    DEC_1   .FILL #1
    DEC_2   .FILL #2
    DEC_3   .FILL #3
    DEC_4   .FILL #4
    DEC_5   .FILL #5
    
    BASE    .FILL xA000
    MAX     .FILL xA005
.END

.ORIG x3200 ; stack push subroutine
    ; check TOS
    NOT R6, R5
    ADD R6, R6, #1
    ADD R6, R6, R4
    BRnz OVERFLOW_X3200   ; if TOS is not less than MAX then we overflow error
    
    ADD R5, R5, #1
    
    STR R1, R5, #0
    
    BR EXIT_OVERFLOW_X3200
    OVERFLOW_X3200
        LEA R0, MSG
        PUTS
    EXIT_OVERFLOW_X3200
    RET
HALT
    MSG .STRINGZ    "ERROR: PUSH ATTEMPTED WHEN STACK IS FULL \n"
.END

.ORIG x3400 ; stack pop subroutine
    ;check TOS
    NOT R6, R5
    ADD R6, R6, #1
    ADD R6, R6, R3
    BRzp UNDERFLOW_X3400   ; if TOS is not less than MAX then we overflow error
    
    ADD R5, R5, #-1
    
    BR EXIT_UNDERFLOW_X3400
    UNDERFLOW_X3400
        LEA R0, UNDERFLOW_MSG
        PUTS
    EXIT_UNDERFLOW_X3400
    RET
HALT
    UNDERFLOW_MSG   .STRINGZ    "ERROR: POP ATTEMPTED WHEN STACK IS EMPTY \n"
.END
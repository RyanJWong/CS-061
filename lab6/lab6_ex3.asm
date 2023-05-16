;=================================================
; Name: Ryan Wong
; Email: rwong098@ucr.edu
; 
; Lab: lab 6, ex 3
; Lab section: 
; TA: 
; 
;=================================================
.ORIG x3000

    LD R3, BASE
    LD R4, MAX
    LD R5, BASE ; TOS
  
    LEA R0, PROMPT
    PUTS
    
    GETC
    OUT
    AND R1, R0, R0
    
    LD R2, PUSH
    JSRR R2
    
    GETC
    OUT
    AND R1, R0, R0
    
    LD R2, PUSH
    JSRR R2
    
    GETC
    OUT
    
    LD R1, top_stack_addr ; DO NOT MODIFY, AND DON'T USE R6, OTHER THAN FOR BACKUP/RESTORE
    LD R2, ADDITION
    JSRR R2
    
    LD R2, PUSH
    AND R1, R0, R0
    JSRR R2
    
    LD R0, EQUALS
    OUT
    
    LD R2, PRINT
    JSRR R2
    
HALT
    PROMPT  .STRINGZ "Please enter two digits and an operand: "
    NEWLINE .FILL   xA
    EQUALS  .FILL x3D
    PUSH    .FILL x3200
    POP     .FILL x3400
    ADDITION .FILL x3600
    PRINT   .FILL x3800
    DEC_1   .FILL #1
    DEC_2   .FILL #2
    DEC_3   .FILL #3
    DEC_4   .FILL #4
    DEC_5   .FILL #5
    
    BASE    .FILL xA000
    MAX     .FILL xA005
    
    top_stack_addr .fill xFE00 ; DO NOT MODIFY THIS LINE OF CODE

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

.ORIG x3600
    
    ADD R1, R1, #-1 ; backup registers
    STR R2, R1, #0
    
    ADD R1, R1, #-1 ; backup registers
    STR R6, R1, #0

    ADD R1, R1, #-1 ; backup registers
	STR R7, R1, #0
    	

    	AND R0, R5, R5
    	LDR R0, R0, #0 ; get value
    	
    	LD R2, POP_ADDR
    	JSRR R2 ; pop
    	
    	AND R2, R5, R5
    	LDR R2, R2, #0
    	
    	ADD R0, R0, R2
	    
	    LD R2, OFFSET
	    ADD R0, R0, R2
	    ADD R0, R0, R2

	    LD R2, POP_ADDR
    	JSRR R2 ; pop
    	
	LDR R7, R1, #0
	ADD R1, R1, #1
	
	LDR R6, R1, #0
	ADD R1, R1, #1
	
	LDR R2, R1, #0
	ADD R1, R1, #1
	
    RET
HALT
    OFFSET  .FILL x-30
    POP_ADDR .FILL x3400
.END

.ORIG x3800
    LDR R0, R5, #0
    LD R2, OFFSET_x3800
    ADD R0, R0, R2
    OUT
    RET
HALT
    OFFSET_x3800  .FILL x30
.END

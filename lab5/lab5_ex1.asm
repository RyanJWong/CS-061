;=================================================
; Name: Ryan Wong
; Email: rwong098
; 
; Lab: lab 5, ex 1
; Lab section: 
; TA: 
; 
;=================================================
.orig x3000
; Initialize the stack. Don't worry about what that means for now.
ld r6, top_stack_addr ; DO NOT MODIFY, AND DON'T USE R6, OTHER THAN FOR BACKUP/RESTORE
LD R1, DATA_PTR
LD R2, newline
LD R3, SUB_GET_STRING
; your code goes here
JSRR R3
LD R0, DATA_PTR
PUTS
halt

; your local data goes here
DATA_PTR        .FILL x3100
SUB_GET_STRING  .FILL x4000
newline         .FILL xA
top_stack_addr .fill xFE00 ; DO NOT MODIFY THIS LINE OF CODE
.end

.ORIG x3100
    ARR             .BLKW #100
.end

; your subroutines go below here
.ORIG x3200
    null            .FILL x0

    ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R1, R6, #0


	; Subroutine code in between
	AND R5, R5, #0
    DO_WHILE_LOOP
        GETC                    ; Store char in R0
        OUT
        AND R4, R0, R0
        
        NOT R4, R4
        ADD R4, R4, #1
        
        ADD R4, R4, R2          ; see if R0 is newline, if it is we exit
        BRz EXIT       ; Repeat while R0 not 0
        STR R0, R1, #0
        ADD R1, R1, #1
        ADD R5, R5, #1
        BR DO_WHILE_LOOP
        
    EXIT
    LD R4, null
    STR R4, R1, #0
    
    STR R1, R6, #0
    LDR R1, R6, #0
	ADD R6, R6, #1
	LDR R7, R6, #0
	ADD R6, R6, #1

	
	RET
	
.end
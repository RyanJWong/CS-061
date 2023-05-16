;=================================================
; Name: Ryan Wong
; Email: rwong098
; 
; Lab: lab 5, ex 2
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
    JSRR R3 ; get string
    
    LD R3, PALINDROME   ; check
    JSRR R3
    
    LD R0, newline
    OUT
    
    LEA R0, output
    PUTS
    
    LD R0, quote
    OUT
    
    LD R0, DATA_PTR
    PUTS
    
    LD R0, quote
    OUT
    
    AND R4, R4, R4  ;check r4
    BRp VALID
    
        LEA R0, not_palindrome
        PUTS
        BR DONE
        
    VALID
        LEA R0, is_palindrome
        PUTS
    DONE
halt

; your local data goes here
DATA_PTR        .FILL x3100
SUB_GET_STRING  .FILL x4000
PALINDROME      .FILL x4200
newline         .FILL xA
quote           .FILL x22
output          .STRINGZ "The string "
is_palindrome   .STRINGZ " IS a palindrome"
not_palindrome  .STRINGZ " IS NOT a palindrome"

top_stack_addr .fill xFE00 ; DO NOT MODIFY THIS LINE OF CODE
.end

.ORIG x3100
    ARR             .BLKW #100
.end

; your subroutines go below here
.ORIG x4000

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

    LDR R1, R6, #0
	ADD R6, R6, #1
	LDR R7, R6, #0
	ADD R6, R6, #1

	
	RET
	
.end

.ORIG x4200
    AND R4, R1, R1
    
    ADD R6, R6, #-1 ; backup registers
	STR R5, R6, #0
    ADD R6, R6, #-1 ; backup registers
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R1, R6, #0
    
	CHECK
        ADD R5, R5, #-1 ; decrement our counter
	    AND R2, R5, R5 ; will use to store last index
	    ADD R2, R4, R2  ; get last address
	    
	    LDR R2, R2, #0 ; get val
	    NOT R2, R2      ; flip and get complement
	    ADD R2, R2, #1
	    
	    LDR R0, R1, #0
	    ADD R2, R0, R2
	    
	    BRnp FALSE   ; if theyre different exit
	    ADD R1, R1, #1
	    AND R0, R5, R5
	    ADD R0, R0, #-1 ; we check n/2 times
	    BRp CHECK
	   
	
    LDR R1, R6, #0  ; restore
	ADD R6, R6, #1
	LDR R7, R6, #0
	ADD R6, R6, #1
	LDR R5, R6, #0
	ADD R6, R6, #1
	
	AND R4, R4, #0
    ADD R4, R4, #1
    BR EXIT_PALINDROME

    FALSE
        AND R4, R4, #0
	  
    
	EXIT_PALINDROME 
	RET
.end



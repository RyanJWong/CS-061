;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Ryan Wong
; Email: rwong098@ucr.edu
; 
; Assignment name: Assignment 3
; Lab section: 023
; TA: Sanchit
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=========================================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------

LD R6, Value_ptr		; R6 <-- pointer to value to be displayed as binary
LDR R1, R6, #0			; R1 <-- value to be displayed as binary 

;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------
LD R2, DEC_16
LD R3, SIGN
LD R5, DEC_4

DO_WHILE_LOOP
    AND R4, R1, R3
    BRz PRINT_ZERO
    
    PRINT_ONE
        LD R0, ASCII1
        OUT
        BR DONE

    PRINT_ZERO
        LD R0, ASCII0
        OUT
    DONE
    ADD R5, R5, #-1
    BRp SKIP
        AND R0, R2, R2
        ADD R0, R0, #-1
        BRnz SKIP
        LD R0, SPACE
        OUT
        LD R5, DEC_4
    SKIP
    ADD R1, R1, R1 ; left shift
    ADD R2, R2, #-1
    BRp DO_WHILE_LOOP ; do 16 times 1 for each digit
    
LD R0, NEWLINE
OUT

HALT
;---------------	
;Data
;---------------
Value_ptr	.FILL xCA01	; The address where value to be displayed is stored
DEC_16      .FILL #16   ; Our loop counter
SIGN        .FILL b1000000000000000
ASCII0      .FILL x30
ASCII1      .FILL x31
NEWLINE     .FILL xA
SPACE       .FILL x20
DEC_4       .FILL #4
.END

.ORIG xCA01					; Remote data
Value .FILL xABCD			; <----!!!NUMBER TO BE DISPLAYED AS BINARY!!! Note: label is redundant.
;---------------	
;END of PROGRAM
;---------------	
.END

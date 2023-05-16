;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Ryan Wong
; Email: rwong098@ucr.edu
; 
; Assignment name: Assignment 2
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

    
;----------------------------------------------
;output prompt
;----------------------------------------------	
LEA R0, intro			; get starting address of prompt string
PUTS			    	; Invokes BIOS routine to output string

;-------------------------------
;INSERT YOUR CODE here
;--------------------------------
LD R4, offset

GETC                    ; prompt and output
OUT

ADD R1, R0, #0          ; store R0 into R1
LD R0, newline          ; load newline and print
OUT

GETC                    ; prompt and output
OUT

ADD R2, R0, #0          ; store R0 into R2
LD R0, newline          ; load newline and print
OUT


ADD R0, R1, #0          ; store R1 into R0 and output
OUT

LD R0, space            ; store space into R0
OUT 

LD R0, subtract
OUT

LD R0, space            ; store space into R0
OUT 

AND R0, R2, R2
OUT

LD R0, space
OUT

LD R0, equals
OUT

LD R0, space
OUT


ADD R2, R2, R4      ; get decimal value

NOT R2, R2          ; flip to get 2's complement
ADD R2, R2, #1      

ADD R3, R1, R2      ; add r1 and r2 store in R3

LD R5, negative
AND R6, R3, R5

BRp positive       ; if negative

    LD R0, subtract ; minus sign
    OUT
    
    NOT R3, R3
    ADD R3, R3, #1
    
    LD R4, offsetp
    ADD R3, R3, R4
    ADD R3, R3, R4

    ADD R0, R3, #0
    OUT
    
    LD R0, newline          ; load newline and print
    OUT
    
BR DONE

positive
    AND R0, R3, R3
    OUT
    LD R0, newline          ; load newline and print
    OUT
DONE

HALT				; Stop execution of program
;------	
;Data
;------
; String to prompt user. Note: already includes terminating newline!
intro 	    .STRINGZ	"ENTER two numbers (i.e '0'....'9')\n" 		; prompt string - use with LEA, followed by PUTS.
newline     .FILL x0A	; newline character - use with LD followed by OUT
subtract    .FILL x2D   ; subtract character
space       .FILL x20   ; space character
equals      .FILL x3D   ; equals character
offset      .FILL x-30   ; ascii offset
offsetp     .FILL x30   ; ascii offset

negative    .FILL b10000    ; check first bit for a 1, if its 1 its negative
;---------------	
;END of PROGRAM
;---------------	
.END


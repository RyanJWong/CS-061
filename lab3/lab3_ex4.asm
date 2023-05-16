;=================================================
; Name: Ryan Wong
; Email: rwong098
; 
; Lab: lab 3, ex 4
; Lab section: 
; TA: 
; 
;=================================================
.ORIG x3000
    LD  R1, newline
    LD  R2, DATA_PTR
    LD  R4, end_arr
    LD  R7, DEC_10


    DO_WHILE_LOOP
            GETC                    ; Store char in R0
            OUT
            AND R6, R0, R0
            
            NOT R6, R6
            ADD R6, R6, #1
            
            ADD R6, R6, R1          ; see if R0 is newline, if it is we exit
            BRnp ADD_TO_ARRAY       ; Repeat while R0 not 0
    BR DONE
    
    ADD_TO_ARRAY
        STR R0, R2, #0              ; store input into arr
        ADD R0, R1, #0
        OUT
        ADD R2, R2, #1              ; increment arrpointer
        
        LDR R5, R2, #0              ; copy r2 address
        
        NOT R5, R5                  ; check if the next address has our terminate hex code x04
        ADD R5, R5, #1
        
        ADD R5, R5, R4
        BRnp DO_WHILE_LOOP
        
    DONE
    LD  R0, DATA_PTR
    PUTS
    
    LD R0, newline
    OUT
    
HALT
    newline     .FILL x0A
    DATA_PTR    .FILL x4000
    end_arr     .FILL x04
    DEC_10      .FILL #10

.END

.ORIG x4000
    ARRAY   .BLKW #100
    ending  .FILL x04

.END


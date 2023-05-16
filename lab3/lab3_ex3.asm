;=================================================
; Name: Ryan Wong
; Email: rwong098
; 
; Lab: lab 3, ex 3
; Lab section: 22
; TA: 
; 
;=================================================
.ORIG x3000

    LEA R1, ARRAY   ; load address into R1
    LD  R2, DEC_10  ; count var
    LD  R4, newline
    
    DO_WHILE_LOOP
            GETC                ; Store char in R0 and output
            OUT
            STR R0, R1, #0      ; store input into arr
            ADD R0, R4, #0
            OUT
            ADD R1, R1, #1
            ADD R2, R2, #-1     ; Add R2 + (#-1) -> R2
            BRp DO_WHILE_LOOP   ; Repeat while R2 > 0
    END_DO_WHILE_LOOP

HALT
    ; Local Data
    ARRAY   .BLKW #10
    DEC_10  .FILL #10
    newline .FILL x0A 
.END


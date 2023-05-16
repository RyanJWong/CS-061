;=================================================
; Name: Ryan Wong
; Email: rwong098@ucr.edu
; 
; Lab: lab 1, ex 1
; Lab section: 
; TA: 
; 
;=================================================

.orig x3000
    ; Code
    AND R1, R1, #0          ; Set R1 <- #0
    LD R2, DEC_12           ; Set R2 <- #12
    LD R3, DEC_6            ; Set R3 <- #6
    
    DO_WHILE_LOOP
        ADD R1, R1, R2      ; Add R1 + R2 -> R1
        ADD R3, R3, #-1     ; Add R3 + (#-1) -> R3
        BRp DO_WHILE_LOOP   ; Repeat while R3 > 0
    END_DO_WHILE_LOOP

    HALT
    
    ; Local Data
    DEC_0   .FILL #0        ; Put 0
    DEC_12  .FILL #12       ; Put 12
    DEC_6   .FILL #6        ; Put 6

.end
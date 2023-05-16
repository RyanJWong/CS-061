;=================================================
; Name: Ryan Wong
; Email: rwong098
; 
; Lab: lab 4, ex 1
; Lab section: 
; TA: 
; 
;=================================================
.ORIG x3000
    LD R1, ARRAY_PTR
    LD R2, SUB_FILL_ARRAY
    LD R3, DEC_10
    JSRR R2

HALT
    DEC_10          .FILL #10
    SUB_FILL_ARRAY  .FILL x3200
    ARRAY_PTR       .FILL x4000
.END



.ORIG x3200
    AND R4, R4, #0
    DO_WHILE_LOOP
        STR R4, R1, #0
        ADD R1, R1, #1
        ADD R4, R4, #1
        ADD R3, R3, #-1
        BRp DO_WHILE_LOOP
    RET
.END

.ORIG x4000
    ARRAY           .BLKW #10
.END
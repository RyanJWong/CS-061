;=================================================
; Name: Ryan Wong
; Email: rwong098
; 
; Lab: lab 4, ex 4
; Lab section: 
; TA: 
; 
;=================================================
.ORIG x3000
    LD R1, ARRAY_PTR
    LD R2, SUB_FILL_ARRAY
    LD R3, DEC_10
    
    JSRR R2
    
    LD R2, SUB_TRAVERSE_ARRAY
    LD R3, DEC_10
    LD R4, OFFSET

    JSRR R2
    
    LD R2, SUB_PRINT_ARRAY
    
    JSRR R2
    
    LD R3, SUB_PRETTY_PRINT_ARRAY
    LEA R4, EQUALS
    JSRR R3
    AND R0, R0, #0

HALT
    DEC_10                  .FILL #10
    OFFSET                  .FILL x30
    EQUALS                  .STRINGZ "====="
    SUB_FILL_ARRAY          .FILL x3200
    SUB_TRAVERSE_ARRAY      .FILL x3400
    SUB_PRINT_ARRAY         .FILL x3600
    SUB_PRETTY_PRINT_ARRAY  .FILL x3800
    ARRAY_PTR               .FILL x4000
.END



.ORIG x3200
    ADD R0, R1, #0
    AND R4, R4, #0
    
    DO_WHILE_LOOP_3200
        STR R4, R0, #0
        ADD R0, R0, #1
        ADD R4, R4, #1
        ADD R3, R3, #-1
        BRp DO_WHILE_LOOP_3200

    RET
.END

.ORIG x3400
    ADD R0, R1, #0
    TRAVERSE_3400
        LDR R6, R0, #0
        ADD R6, R6, R4
        STR R6, R0, #0
        ADD R0, R0, #1
        ADD R3, R3, #-1
        BRp TRAVERSE_3400

    RET
.END

.ORIG x3600
    ADD R0, R1, #0
    PUTS
    
    RET
.END

.ORIG x3800
    ADD R0, R4, #0
    PUTS
    
    AND R0, R0, #0
    
    AND R3, R3, #0

    ADD R3, R7, #0
    
    JSRR R2
    
    AND R7, R7, #0
    ADD R7, R3, #0
    AND R0, R0, #0

    ADD R0, R4, #0
    PUTS
    
    AND R0, R0, #0

    RET
.END

.ORIG x4000
    ARRAY           .BLKW #10
.END
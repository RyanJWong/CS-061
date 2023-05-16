;=================================================
; Name: Ryan Wong
; Email: rwong098@ucr.edu
; 
; Lab: lab 1, ex 0
; Lab section: 
; TA: 
; 
;=================================================

.ORIG x3000
    LEA R0, MSG_TO_PRINT                        ; Store MSG -> R0
    PUTS                                        ; Print R0
    
    HALT

    ; Local data    
    MSG_TO_PRINT .STRINGZ "Hello world!\n"
    
.END
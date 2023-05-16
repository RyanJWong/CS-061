.ORIG x3000

LD R5, NEGASCII0 ;load the negated ASCII “0” offset

TRAP x23 ;the trap instruction which is also known as “IN”

ADD R1,R0,R5 ;move the first integer to register 1

TRAP x23 ;another “IN”

ADD R2,R0,R5 ;move the second integer to register 2

NOT R2,R2

ADD R2,R2,x1 ;negate R2 (-A == (NOT A) + 1)

LEA R0,MESG ;load the address of the message string

TRAP x22 ;”PUTS” outputs a string

ADD R2,R2,R1 ;add the two integers

BRZP NOTNEG ;total is >= 0 so output

LD R0,MINUS

TRAP x21 ;output – character

NOT R2,R2

ADD R2,R2,x1 ;negative R2 (since it was -#)

NOTNEG

LD R5,ASCII0 ;load the ASCII “0” value

ADD R0,R2,R5 ;move the difference to R0, to be output

TRAP x21 ;display the difference

DONE HALT

MESG  .STRINGZ "The difference of those two numbers is"

MINUS .FILL 0x002D ;- CHARACTER

ASCII0      .FILL 0x0030 ;theascii value of 0

NEGASCII0 .FILL xFFD0 ;the negative version of the ASCII mask (-x30)

.END


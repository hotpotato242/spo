subrut  START   0

main	LDX	saveX
	LDA	in,X
	STA	arg
	JSUB	poly
	LDA	tmp
	STA	poli,X
	RMO	X,A
	ADD	#3
	STA	saveX
	COMP	#len
	JLT	main
halt	J	halt


.rezultat je v tmp

poly    STA     saveA
        LDA     result
        STA     store2
        LDA     osnova
        STA     store3
        LDA     stev1
        STA     store1
next    LDA     stev1
        SUB     #1
        STA     stev1
        COMP    #0
        JGT     zacexp
. stev1 je 0, dodaj se 5 pa konc
        LDA     result
        ADD     #5
        STA     tmp
        LDA     store1
        STA     stev1
        LDA     store2
        STA     result
        LDA     store3
        STA     osnova
        LDA     saveA
        RSUB

.glavni loop
zacexp  LDA     stev1
        STA     stev2
        LDA     #1
        STA     tmp
loopex  LDA     tmp
        MUL     arg
        STA     tmp
        LDA     stev2
        SUB     #1
        STA     stev2
        COMP    #0
        JGT     loopex
endexp  LDA     tmp
        MUL     osnova
        ADD     result
        STA     result
        LDA     osnova
        ADD     #1
        STA     osnova
        J       next

arg     RESW    1
stev1   WORD    5
stev2   WORD    5
tmp     RESW    1
result  WORD    0
osnova  WORD    1
saveA   RESW    1
.argumnt storage
store1  RESW    1
store2  RESW    1
store3  RESW    1
poli    RESW    3
saveX	WORD	0
in	WORD	0
	WORD	5
	WORD	42
lastin	EQU	*

len	EQU	lastin-in

        END     main
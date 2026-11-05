echo	START	0


main	LDA	#65
	JSUB	f1

	JSUB	f2_hd

	LDA	#string
	.dodaj null
	JSUB	f3_hd

	LDA	#1234
	JSUB	f4_hd

halt	J	halt

.char
f1	TD	stdout
	JEQ	f1
	WD	stdout
	RSUB

.nl
f2_hd	STA	saveA
	LDA	#10
f2_bd	TD	stdout
	JEQ	f2_bd
	WD	stdout
	LDA	saveA
	RSUB
	

.string
f3_hd   STA     saveA
        STX     saveX
        STL     saveL
        RMO     A,X
f3_bd1  CLEAR   A
        LDCH    0,X
        COMP    #0
        JEQ     f3_tl
f3_bd2  TD      stdout
        JEQ     f3_bd2
        WD      stdout
        LDA     #1
        ADDR    A,X
        J       f3_bd1
f3_tl   LDA     saveA
        LDX     saveX
        LDL     saveL
        RSUB	


.num
f4_hd	STA	saveA
	STX	saveX
	STL	saveL
	LDA	#0
	STA	offset
	LDA	saveA
f4_bd1	COMP	#0
	JEQ	f4_bd2
	STA	tp2_f4		
	DIV	#10
	STA	tp_f4		
	MUL	#10
	RMO	A,X
	LDA	tp2_f4
	SUBR	X,A		
	LDX	offset
	STCH	stevil,X
	LDA	#1
	ADDR	A,X
	STX	offset
	LDA	tp_f4
	J	f4_bd1
f4_bd2	LDX	offset
	LDA	#1
	SUBR	A,X
f4_bd3	CLEAR	A
	LDCH	stevil,X
	ADD	#48
f4_bd4	TD	stdout
	JEQ	f4_bd4
	WD	stdout
	RMO	X,A
	COMP	#0
	JEQ	f4_tl
	LDA	#1
	SUBR	A,X
	J	f4_bd3
f4_tl	LDA	saveA
	LDX	saveX
	LDL	saveL
	RSUB




stdout	BYTE	X'01'


.za shranjevanje a in x v gnezdenih klicih
saveX	RESW	1
saveL	RESW	1
saveA	RESW	1
string	BYTE	C'banana'
null	BYTE	X'00'
stevil	RESB	5
offset	WORD	0
tp_f4	RESW	1
tp2_f4	RESW	1
	END echo
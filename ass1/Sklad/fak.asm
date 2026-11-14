fak	START	0


main	STL	storeL
	JSUB	stinit
	LDL	storeL
	.init ^^^
	
	.najprej izracun
	LDA	#5
	JSUB	f1_hd
	.izpis
	JSUB	f4_hd
	JSUB	f2_hd

	LDA	#6
	JSUB	f1_hd
	JSUB	f4_hd
	JSUB	f2_hd


halt	J	halt

.num
f4_hd	STA	storeA
	STX	storeX
	STL	storeL
	LDA	#0
	STA	offset
	LDA	storeA
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
f4_tl	LDA	storeA
	LDX	storeX
	LDL	storeL
	RSUB


.nl
f2_hd	STA	storeA
	LDA	#10
f2_bd	TD	stdout
	JEQ	f2_bd
	WD	stdout
	LDA	storeA
	RSUB
	


f1_hd	STL	@stptr
	JSUB	stpush
	STA	@stptr
	JSUB	stpush
	.shrani vse
	COMP	#1
	JEQ	f1_bd
	SUB	#1
	JSUB	f1_hd
	.rekurzivno do 1
f1_bd	RMO	A,S
	JSUB	stpop
	LDA	@stptr
	JSUB	stpop
	LDL	@stptr

	MULR	S,A
	RSUB

	

stinit	STA	storeA
	LDA	#sklad
	STA	stptr
	LDA	storeA
	RSUB

stpush	STA	storeA
	LDA	stptr
	ADD	#3	
	STA	stptr	
	LDA	storeA
	RSUB

stpop	STA	storeA
	LDA	stptr
	COMP	#sklad
	JEQ	skip
	SUB	#3
skip	STA	stptr
	LDA	storeA
	RSUB

storeA	RESW	1
storeL	RESW	1
storeX	RESW	1
sklad	RESW	100
stptr	RESW	1
stdout	BYTE	X'01'
stevil	RESB	5
offset	WORD	0
tp_f4	RESW	1
tp2_f4	RESW	1
	END	main

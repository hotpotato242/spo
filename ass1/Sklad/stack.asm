stack	START	0

main	STL	storeL
	JSUB	stinit
	LDL	storeL
	.init ^^^
	STL	@stptr
	JSUB	stpush
	LDA	#3
	STA	@stptr
	JSUB	stpush
	LDA	#5
	STA	@stptr
	JSUB	stpush
	.pushanje ^^^
	JSUB	stpop
	LDA	@stptr
	JSUB	stpop
	LDA	@stptr
	JSUB	stpop
	LDL	@stptr
	.popanje ^^^
halt	J	halt


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
	END	main

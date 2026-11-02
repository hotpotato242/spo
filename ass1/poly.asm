poly	START	0


main	LDA	x
	MULR	A,A
	MULR	A,A
	STA	result
	LDA	x
	LDT	x
	MULR	T,A
	MULR	T,A
	MUL	#2
	LDT	result
	ADDR	T,A
	STA	result
	LDA	x
	LDT	result
	MULR	A,A
	MUL	#3
	ADDR	T,A
	STA	result
	LDA	x
	LDT	result
	MUL	#4
	ADDR	T,A
	ADD	#5
	STA	result
halt	J	halt
.lahko bi naredil tudi tako da bi uporabljal le register A


.data
x	WORD 	2
result	RESW	1

	END	main
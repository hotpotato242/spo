arithr START 0

main	LDA	x
	RMO	A, S
	LDT	y
	ADDR	T, A
	STA	sum
	RMO	S, A
	SUBR	T, A
	STA	diff
	RMO	S, A
	MULR	T, A
	STA	prod
	RMO	S, A
	DIVR	T, A
	STA	quot
	MULR	T, A
	RMO	A, T
	RMO	S, A
	SUBR	T, A
	STA	mod
halt	J	halt

x	WORD	16
y	WORD	12
sum	RESW	1
diff	RESW	1
prod	RESW	1
quot	RESW	1
mod	RESW	1
	END	main
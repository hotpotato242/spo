arith	START	0

main	LDA	x
	ADD	y
	STA	sum
	LDA	x
	SUB	y
	STA	diff
	LDA	x
	MUL	y
	STA	prod
	LDA	x
	DIV	y
	STA	quot
	LDA	x
	DIV	y
	MUL	y
	STA	mod
	LDA	x
	SUB	mod
	STA	mod
halt	J	halt

.data
x	WORD	12
y	WORD	16
sum	RESW	1
diff	RESW	1
prod	RESW	1
quot	RESW	1
mod	RESW	1
	END main
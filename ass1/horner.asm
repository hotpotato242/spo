horner	START	0


.5+(4+(3+(2+x)x)x)x

main	LDA	x
	JSUB	stiri
	MUL	x
	ADD	#5
	STA	result	
halt	J	halt

stiri	STL	povrat1
	JSUB	tri
	MUL	x
	ADD	#4
	LDL	povrat1
	RSUB

tri	STL	povrat2
	JSUB	dva
	MUL	x
	ADD	#3
	LDL	povrat2
	RSUB

dva	ADD	#2
	RSUB

x	WORD	2
result	RESW	1
povrat1	RESW	1
povrat2 RESW	1
	END	main
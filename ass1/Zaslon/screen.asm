print	START	0

main	LDA	#niz
	.naslov niza nalozimo
	JSUB	prints
	LDA	row
	ADD	#10
	STA	row
	LDA	col
	ADD	#10
	STA	col
	LDA	#niz
	JSUB	prints


	LDCH	znak
	JSUB	scr
	CLEAR	A
	JSUB	scr

	

halt	J	halt


prints		STA	storeA
		STX	storeX
		STL	storeL
		CLEAR	X
		STX	stevec
hd2		.izracun naslova
		LDA	#scrcols
		MUL	row
		ADD	col
		STA	offset
		.preglej ali si izven screena in prenehaj ce si 
		COMP	#scrlen
		JGT	tl2

		LDX	stevec
		LDCH	niz,X
		LDX	offset
		+STCH	screen,X
		LDA	col
		ADD	#1
		STA	col
		LDX	stevec
		TIX	#len
		STX	stevec
		JLT	hd2
tl2		LDA	storeA
		LDL	storeL
		LDX	storeX
		RSUB


		

scr		STA	storeA
		STL	storeL
		STX	storeX
		CLEAR	X
		
	
hd1		+STCH	screen,X
		TIX	#scrlen
		JLT	hd1

		LDA	storeA
		LDL	storeL
		LDX	storeX
		RSUB


screen	EQU	0xB800
scrcols	EQU	25
scrrows	EQU	80
scrlen	EQU	scrcols*scrrows

storeL	RESW	1
storeA	RESW	1
storeX	RESW	1
znak	BYTE	C'A'

row	WORD	0
col	WORD	0
offset	RESW	1
stevec	RESW	1
niz	BYTE	C'banana mango'
tmp	EQU	*
len	EQU	tmp-niz
	END	main

balls	START	0

main	JSUB	init

	J	do1



.inicializiraj piko nekje na sredini
init	LDA	#12
	STA	prej_i
	STA	pika_i
	LDA	#40
	STA	prej_j
	STA	pika_j
	RSUB


.poglej predznak i in naredi temu primerno potezo
do1	LDA	sign_i
	COMP	#0
	JEQ	plus_i
	J	min_i
.se za j isto
do2	LDA	sign_j
	COMP	#0
	JEQ	plus_j
	J	min_j
.narisi piko in preglej meje
do3	JSUB	meja1
	
	LDA	pika_i
	MUL	#scrcols
	ADD	pika_j
	RMO	A,X
	CLEAR	A
	LDCH	pika
	+STCH	screen,X
	JSUB	izbris
	J	do1

.pristevanje in odstevanje
plus_i	LDA	pika_i
	ADD	#1
	STA	pika_i
	J	do2

min_i	LDA	pika_i
	SUB	#1
	STA	pika_i
	J	do2

plus_j	LDA	pika_j
	ADD	#1
	STA	pika_j
	J	do3

min_j	LDA	pika_j
	SUB	#1
	STA	pika_j
	J	do3

.izbris prejsnje 
izbris	LDA	prej_i
	MUL	#scrcols
	ADD	prej_j
	RMO	A,X
	CLEAR	A
	LDCH	presl
	+STCH	screen,X
	LDA	pika_i
	STA	prej_i
	LDA	pika_j
	STA	prej_j
	RSUB
	

.spodnja meja za i 
meja1	LDA	sign_i
	COMP	#0
	JEQ	meja3
	J	meja4
meja2	LDA	sign_j
	COMP	#0
	JEQ	meja5
	J	meja6

.poglej ali je izven spodnjega dela ekrana, odstej ena ker gre do 79
meja3	LDA	#scrrows
	SUB	#1
	COMP	pika_i
	JEQ	meja7
	J	meja2

.poglej ali je izven zgornjega dela ekrana
meja4	LDA	pika_i
	COMP	#0
	JEQ	meja7
	J	meja2

.poglej ali je j izven desnega dela
meja5	LDA	#scrcols
	SUB	#1
	COMP	pika_j
	JEQ	meja8
	RSUB


.poglej ali je j izven levega dela
meja6	LDA	pika_j
	COMP	#0
	JEQ	meja8
	RSUB

.sprememba predznaka i
meja7	LDA	#1
	SUB	sign_i
	STA	sign_i
	J	meja2

meja8	LDA	#1
	SUB	sign_j
	STA	sign_j
	RSUB


screen	EQU	0xB800
scrcols	EQU	160
scrrows	EQU	50

pika_i	RESW	1
pika_j	RESW	1
prej_i	RESW	1
prej_j	RESW	1
sign_i	WORD	0
sign_j	WORD	0
.0 je pozitivna smer gibanja, 1 negativna

pika	BYTE	X'40'
presl	BYTE	X'20'

	END	main
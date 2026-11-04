cat     START   0

        LDX     #0

.branje
read    TD      stdin
        JEQ     read

        RD      stdin
        COMP    #10
	.znak za enter
        JEQ     output

        STCH    buffer,X
        TIX    	#100
        JLT     read

.izpis
output  LDX     #0

write   TD      stdout
        JEQ     write

        LDCH    buffer,X
        WD      stdout

        TIX     #100
        JLT     write

halt    J       halt

stdin   BYTE    X'00'
stdout  BYTE    X'01'

buffer  RESB    100

        END     cat
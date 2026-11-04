print   START   0

main    LDX     #0

wait    TD      device
        JEQ     wait
.test device rezultat da v cc
write   LDCH    niz,X
        WD      device
.ldch  nalozi v a najbolj desni byte
        TIX     #7
        JLT     wait
.tix poveca x za ena in nato primerja vsebino x z vsebino podanega naslova
halt    J       halt

device  BYTE    X'A0'
niz     BYTE    C'SIX/XE'
        BYTE    X'0A'

        END     main
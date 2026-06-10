.data
TABLA: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
X: .word 7
CANT: .word 0
RES: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 

.code
ld r1, TABLA(r0)
ld r2, X(r0)
ld r3, CANT(r0)
ld r4, RES(r0)
dadd r5, r0, r0
daddi r6, r0, 0x50

loop:
    slt r4, r2, r1
    sd r4, RES(r5)
    daddi r5, r5, 8
    beq r4, r0, seguir 
    daddi r3, r3, 1
    seguir: 
    ld r1, TABLA(r5)
    ld r4, RES(r5)
    bne r5, r6, loop
    sd r3, CANT(r0)    
halt
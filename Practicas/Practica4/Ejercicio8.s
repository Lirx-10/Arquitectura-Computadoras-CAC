.data
X: .word 3
Y: .word 2
RESUL: .word 0

.code
ld r1, X(r0) 
ld r2, Y(r0) 
daddi r3, r0, 1
dadd r4, r0, r0

loop:
    dadd r4, r4, r1
    bne r3, r2, loop
    daddi r3, r3, 1
    sd r4, RESUL(r0)
halt
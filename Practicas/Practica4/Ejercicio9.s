.data
X: .word 1
Y: .word 5
a: .word 3
RESUL: .word 0

.code
ld r1, X(r0)
ld r2, Y(r0)
ld r3, a(r0)

beqz r3, fin
nop
daddi r3, r3, -1 
loop:
    dadd r1, r1, r2 
    bnez r3, loop
    daddi r3, r3, -1 
fin:
sd r1, RESUL(r0)
halt
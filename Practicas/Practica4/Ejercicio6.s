.data
A: .word 5
B: .word 5
C: .word 5
D: .word 0

.code
ld r1, A(r0)
ld r2, B(r0)
ld r3, C(r0)


beq r1, r2, siguiente
beq r1, r3, solo_dos
beq r2, r3, solo_dos
ninguna:
    dadd r4,r0,r0
    j fin
siguiente: 
    beq r1, r3, todas
solo_dos:
    daddi r4, r0, 2
    j fin
todas:
    daddi r4, r0, 3 
    j fin
fin:
sd r4, D(r0)

halt
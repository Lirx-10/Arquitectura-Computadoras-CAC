.data
CONTROL: .word 0x10000
DATA: .word 0x10008
NUM: .word 0

.code
lwu $s0, CONTROL(r0)
daddi $t0, r0, 8
sd $t0, 0($s0)

lwu $s1, DATA(r0)
ld $t1, 0($s1)

sd $t1, NUM(r0)

halt
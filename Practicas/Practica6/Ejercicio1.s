.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
texto: .asciiz "...."

.text
; Limpio la pantalla alfanumérica
lwu $s1, CONTROL(r0)
daddi $t0, $0, 6
sd $t0, 0($s1)



;Defino la longitud del string y un contador para terminar de leer, dirección de data en un registro
daddi $t3, r0, 4
dadd $t2, r0, r0
lwu $s0, DATA(r0)

;Pongo 9 en un registro, para pasarle al control (recibir caracter)
daddi $t0, $0, 9

;Recibo caracter por caracter en data, y lo voy almacenando en una dirección de memoria
loop:
    sd $t0, 0($s1)
    lbu $t1, 0($s0)
    sb $t1, texto($t2)
    daddi $t2, $t2, 1
    bne $t2, $t3, loop

;Obtengo la dirección del string que guardé, y le paso el comienzo a DATA
daddi $t2, r0, texto
sd $t2, 0($s0)

;Configuro el control para que imprima
daddi $t0, $0, 4
sd $t0, 0($s1)

halt
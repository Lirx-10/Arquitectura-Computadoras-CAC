.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
color: .byte 0, 0, 255, 0

.code
lwu $a0, CONTROL($0)
lwu $a1, DATA($0)

jal LEER_NUM
dadd $a2, $0, $v0 ;coordenada en X
jal LEER_NUM
dadd $a3, $0, $v0 ;coordenada en y

jal DIBUJAR_PUNTO

halt

LEER_NUM:
    daddi $t0, $0, 6 ;Limpiar pantalla alfanumerica
    daddi $t1, $0, 8 ;Recibir un numero entero por teclado
    daddi $t4, $0, -1 ;Rango a partir de 0
    daddi $t5, $0, 50 ;Rango hasta 49
    loop:
        ;Limpio la pantala alfanumérica, y me traigo el numero entero
        sd $t0, 0($a0)
        sd $t1, 0($a0)
        ld $v0, 0($a1)
        ;Valido que sea un numero entre 0 y 49
        slt $t3, $v0, $t5
        beqz $t3, loop
        slt $t3, $t4, $v0
        beqz $t3, loop 
jr $ra

DIBUJAR_PUNTO:
    ;Limpio la pantalla
    daddi $t0, $0, 7
    sd $t0, 0($a0)
    ;Cargo el color
    lwu $t1, color(r0)
    sw $t1, 0($a1)

    ;Cargo las coordenadas
    sb $a2, 5($a1) ;Coordenada en X
    sb $a3, 4($a1) ;Coordenada en Y
    
    ;Imprimo en pantalla
    daddi $t0, $0, 5
    sd $t0, 0($a0)
jr $ra
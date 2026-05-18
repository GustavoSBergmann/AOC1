.data
a: .word 5
b: .word 5
c: .word 1
mediana: .space 4
#Mediana = 3

.text
lui $t0, 0x1001  #$t0 = 0x10010000 (base)
lw $t1, 0x0($t0) #t1 = a
lw $t2, 0x4($t0) #t1 = b
lw $t3, 0x8($t0) #t1 = c

slt $t4, $t1, $t3 #$t4 = $t1 < $t3
slt $t5, $t2, $t1 #$t5 = $t2 < $t1
beq $t4, $t5, CASO1

slt $t4, $t2, $t3 #$t4 = $t2 < $t3
slt $t5, $t1, $t2 #$t5 = $t1 < $t2
beq $t4, $t5, CASO2

slt $t4, $t3, $t2 #$t4 = $t3 < $t2
slt $t5, $t1, $t3 #$t5 = $t1 < $t3
beq $t4, $t5, CASO3
j FIM

CASO1: sw $t1, 0xC($t0) #mediana = $t1
j FIM
CASO2: sw $t2, 0xC($t0) #mediana = $t2
j FIM
CASO3: sw $t3, 0xC($t0) #mediana = $t3
j FIM

FIM:
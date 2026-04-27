.data
a: .word 3 #0x10010000 = 3
y: .space 4 #0x10010004 = reservado

.text
lui $t0, 0x1001 #$t0 = 0x10010000
lw $t1, 0($t0)  #$t1 = 0 + 0x10010000

addi $t2, $zero, 9 #$t2 = 9
mult $t2, $t1      #$t2 * $t1 = 9 * 3 = 27
mflo $t2           #$t2 = 27
addi $t2, $t2, -5  #$t2 = $t2 - 5 = 27 - 5 = 22

mult $t2, $t1     #$t2 * $t1 = 22 * 3 = 66
mflo $t2          #$t2 = 66
addi $t2, $t2, 7  #$t2 = $t2 + 7 = 66 + 7 = 73

mult $t2, $t1     #$t2 * $t1 = 73 * 3 = 219
mflo $t2          #$t2 = 219
addi $t2, $t2, 15 #$t2 = $t2 + 15 = 219 + 15 = 234

sw $t2, 4($t0)    #0x10010004 = $t2 = y
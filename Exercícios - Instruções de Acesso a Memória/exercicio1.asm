.data
a: .word 3  #0x10010000 = 3
b: .word 5  #0x10010004 = 5
y: .space 4 #0x10010008 = reservado

.text
lui $t0, 0x1001 #$t0 = 0x10010000
lw $t1, 0($t0)  #$t1 = 0 + $t0
lw $t2, 4($t0)  #$t2 = 4 + $t0

addi $t3, $zero, 32 #$t3 = 32
mult $t3, $t1       #$t3 * $t1 = 32 * 3 = 96
mflo $t3            #$t3 = 96
mult $t3, $t2       #$t3 * $t2 = 96 * 5 = 480
mflo $t3            #$t3 = 480

addi $t4, $zero, -3 #$t4 = 3
mult $t4, $t1       #$t4 * $t1 = -3 * 3 = -9
mflo $t4            #$t4 = -9

addi $t5, $zero, 7 #$t5 = 7
mult $t5, $t2      #$t5 * $t2 = 7 * 5 = 35 
mflo $t5           #$t5 = 35

add $t3, $t3, $t4  #$t3 = $t3 + $t4
add $t3, $t3, $t5  #$t3 = $t3 + $t5
addi $t3, $t3, -13 #$t3 = $t3 - 13

sw $t3, 8($t0)     #0x10010008 = $t3 = y
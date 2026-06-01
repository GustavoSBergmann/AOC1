.data
.word 0xD
.word 0xE
.word 0xC
.word 0xA
.word 0xD
.word 0xA
.word 0x2
.word 0x0

.text
lui $t0, 0x1001    #$t0 = 0x10010000 = reg. base
addi $t1, $zero, 0 #$t1 = i = 0

LOOP: slti $t2, $t1, 8 #$t2 = i < 8
beq $t2, $zero, FIM    #if(i >= 8)
lw $t6, 0($t0)         #$t6 = vetor[i]
add $t7, $t7, $t6      #$t7 = $t7 + $t6

slti $t2, $t1, 7       #$t2 = i < 7
beq $t2, $zero, FIM    #if(i >= 7)
sll $t7, $t7, 4        #$t7 = shiftLeft($t7)

addi $t1, $t1, 1   #$t1 = i += 1
addi $t0, $t0, 0x4 #$t0 += 0x4
j LOOP

FIM:
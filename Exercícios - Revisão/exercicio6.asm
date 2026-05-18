.text
ori $t1, $zero, 31 #$t1 = 31
ori $t2, $zero, 0  #$t2 = 0

LOOP: beq $t1, $zero, FIM
srl $t1, $t1, 1 #$t1 = shiftRight($t1)
addi $t2, $t2, 1 #$t2 += 1
j LOOP

FIM:
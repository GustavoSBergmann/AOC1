.data 
n: .word 5  #0x10010000 = 5
A: .space 4 #0x10010000 = reservado

.text
lui $t0, 0x1001    #$t0 = 0x10010000
addi $t1, $zero, 0 #$t1 = i = 0
addi $s0, $zero, 1 #$s0 = 1 = produtorio
lw $s1, 0($s0) 	   #$t2 = n = 5
addi $s3, $s1, 1 #$s3 = n + 1

LOOP: slt $t7, $t1, $s3 #if(i <= 5) then
beq $t7, $zero, FIM
sra $t2, $t1, 1 #$t2 = i / 2
add $t2, $t2, $s1 #$t2 = n + i/2
mult $t2, $s0 #produtorio * (n + i/2)
mflo $s0 #Prod
j LOOP

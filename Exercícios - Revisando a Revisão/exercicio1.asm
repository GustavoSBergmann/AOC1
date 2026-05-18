.data
vetor: .word 0,1,2,3,4,5,6,7 #0x10010000

.text
# Inicalização
lui $t0, 0x1001    #$t0 = 0x10010000
addi $t1, $zero, 0 #$t1 = i = 0
addi $t2, $zero, 2 #$t2 = 2
		   #$t3 = i < 8
		   #$t4 = i %2
		   #$t5 = i * 2 ou vetor[i] + vetor[i-1]
		   
add $s0, $zero, $t0 #$s0 = $t0

#For(i = 0; i < 8; i++)
LOOP: slti $t3, $t1, 8 #$t3 = i < 8
beq $t3, $zero, FIM    #if(i >= 8)
div $t1, $t2 #i % 2
mfhi $t4     #i % 2

bne $t4, $zero, ELSE
sll $t5, $t1, 1 #$t5 = i * 2
sw $t5, 0($s0)  #vetor[i] = i * 2
j ITERACAO

ELSE: lw $t6, 0($s0) #$t6 = vetor[i]
lw $t7, -4($s0)      #$t7 = vetor[i-1]
add $t5, $t6, $t7    #$t5 = vetor[i] + vetor[i-1]
sw $t5, 0($s0)       #vetor[i] = vetor[i] + vetor[i-1]

ITERACAO: addi $t1, $t1, 1 #$t1 = i += 1
sll $s1, $t2, 1            #$s1 = i * 4
add $s0, $s0, $s1          #$s0 += 4
j LOOP

FIM:






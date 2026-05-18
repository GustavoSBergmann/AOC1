.data 
vetor_0: .word 0 #0x10010000 = 0
vetor_1: .word 1 #0x10010004 = 1
vetor_2: .word 2 #0x10010008 = 2
vetor_3: .word 3 #0x1001000C = 3
vetor_4: .word 4 #0x10010010 = 4
vetor_5: .word 5 #0x10010014 = 5
vetor_6: .word 6 #0x10010008 = 6
vetor_7: .word 7 #0x1001000C = 7

.text
#Inicialização
lui $t0, 0x1001 #$t0 = 0x10010000 = reg. base
addi $t1, $zero, 0 #$t1 = 0 = i
addi $t2, $zero, 2 #$t2 = 2

TESTE: slti $t3, $t1, 8 #$t3 = $t1 < 8 = i < 8

beq $t3, $zero, FIM #if($t3 == 0) jump FIM
div $t1, $t2 #$t1 % $t2 = i % 2
mfhi $t4 #$t4 = $t1 % $t2 = i % 2

bne $t4, $zero, ELSE #if(i % 2 == 0)
sll $s0, $t1, 2 #$s0 = i * 4
add $s0, $s0, $t0 #$0 = &vetor[i]
sll $t5, $t1, 1 #$t5 = shift($t1) = i * 2
sw $t5, 0($s0) #vetor[i] = i * 2
j ITERACAO

ELSE:
sll $s0, $t1, 2 #$s0 = i * 4
add $s0, $s0, $t0 #$0 = &vetor[i]
lw $t6, 0($s0) #$t6 = vetor[i]
lw $t7, -4($s0) #$t7 = vetor[i-1]
add $t6, $t6, $t7 #$t6 = $t6 + $t7 = vetor[i] + vetor[i-1]
sw $t6, 0($s0) #vetor[i] = vetor[i] + vetor[i-1]
ITERACAO: addi $t1, $t1, 1 #$t1 => i += 1
j TESTE
FIM: 
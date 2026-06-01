.data
vetor: .word 1,2,3,5,5,6,7,8,9,10

.text
li $t0, 1     #$t0 = flag = 1
la $t1, vetor #$t1 = 0x10010000 = reg. base
li $t2, 0     #$t2 = i = 0
	      #$t3 = (i < 10)
	      #$t4 = vetor[i]
	      #$t5 = vetor[i+1]
	      #$t6 = (vetor[i] < vetor[i+1])

LOOP:
slti $t3, $t2, 9 #$t3 = (i < 9)
beqz $t3, FIM    #if(i >= 10)

lw $t4, 0($t1)   #$t4 = vetor[i]
lw $t5, 4($t1)   #$t5 = vetor[i+1]
addi $t5, $t5, 1 #$t5 = vetor[i+1] + 1

slt $t6, $t4, $t5     #$t6 = (vetor[i] <= vetor[i+1])
beqz $t6, DESORDENADO #if(vetor[i] > vetor[i+1])

ITERACAO: 
addi $t1, $t1, 4 #reg. base += 4
addi $t2, $t2, 1 #i++
j LOOP

DESORDENADO: li $t0, 0 #$t0 = flag = 0

FIM: 
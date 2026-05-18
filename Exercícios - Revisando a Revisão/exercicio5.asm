.data
lim_inf: .word 10 #0x10010000
lim_sup: .word 20 #0x10010004
tamanho: .word 9  #0x10010008
vetor:   .word 8,15,26,10,20,7,23,18,13 #0x1001000C

.text
lui $t0, 0x1001    #$t0 = 0x10010000

lw $s0, 0x0($t0)   #$s0 = limite inferior
addi $s0, $s0, -1  #$s0 = limite inferior
lw $s1, 0x4($t0)   #$s1 = limite superior
addi $s1, $s1, 1   #$s1 = limite superior
addi $s2, $zero, 0 #$s2 = quantidade válidos
addi $s3, $t0, 0xC #$s3 = &vetor[0]
lw $s4, 0x8($t0)   #$s4 = tamanho

addi $t1, $zero, 0 #$t1 = i = 0
		   #$t2 = i < tamanho
		   #$t3 = lim_inf < vetor[i]
		   #$t4 = vetor[i] < lim_sup
		   #$t5 = valor temporário

LOOP: slt $t2, $t1, $s4 #$t2 = i < tamanho
beq $t2, $zero, FIM     #if(i >= tamanho)
lw $t5, 0($s3)          #&vetor[i]
slt $t3, $s0, $t5       #$t3 = lim_inf < vetor[i]
slt $t4, $t5, $s1       #$t4 = vetor[i] < lim_sup
bne $t3, $t4, ITERACAO  #if(lim_inf < vetor[i] < lim_sup)
addi $s2, $s2, 1        #$s2 = quantidade += 1

ITERACAO:addi $t1, $t1, 1 #i += 1
addi $s3, $s3, 0x4         #&vetor[i] + 4
j LOOP

FIM:

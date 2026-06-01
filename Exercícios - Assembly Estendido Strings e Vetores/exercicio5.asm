.data
tamanho: .word 7
vetor1: .word -30, -23, 56, -43, 72, -18, 71
vetor2: .word 45, 23, 21, -23, -82, 0, 69
soma: .word 0, 0, 0, 0, 0, 0, 0

.text
la $t0, tamanho #$t0 = &tamanho
la $t1, vetor1  #$t1 = &vetor1[0]
la $t2, vetor2  #$t2 = &vetor2[0]
la $t3, soma    #$t3 = &soma[0]
li $t4, 0       #$t4 = i = 0
		#$t5 = (i < tamanho)
		
		
lw $s0, 0($t0)  #$s0 = tamanho
		#$s1 = vetor1[i]
		#$s2 = vetor2[i]
		#$s3 = soma[i]

LOOP:
slt $t5, $t4, $s0 #$t5 = (i < tamanho)
beqz $t5, FIM     #if(i >= tamanho)
lw $s1, 0($t1)    #$s1 = vetor1[i]
lw $s2, 0($t2)    #$s2 = vetor2[i]
add $s3, $s1, $s2 #$s3 = vetor1[i] + vetor2[i]
sw $s3, 0($t3)    #soma[i] = $s3

addi $t1, $t1, 4  #&vetor1[i] + 4
addi $t2, $t2, 4  #&vetor2[i] + 4
addi $t3, $t3, 4  #&soma[i] + 4
addi $t4, $t4, 1  #i++
j LOOP

FIM:
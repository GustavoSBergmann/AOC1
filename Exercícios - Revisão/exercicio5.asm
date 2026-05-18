.data 
lim_inf: .word 10  #0x10010000
lim_sup: .word 20 #0x10010004
tamanho: .word 9  #0x10010008
vetor: .word -5, -10, 10, 8, 19, 15, 12, 24, 20 #0x1001000C

.text
lui $t0, 0x1001    #$t0 = 0x10010000 = reg. base
lw $s0, 0x0($t0)   #$s0 = limite inferior
lw $s1, 0x4($t0)   #$s1 = limite superior
addi $s2, $zero, 0 #$s2 = quantidade
addi $s3, $t0, 0xC #$s3 = &vetor[0]
lw $s4, 0x8($t0)   #$s4 = tamanho
		   #$s5 = lim_inf < vetor[i]
		   #$s6 = vetor[i] < lim_sup

addi $t1, $s0, -1   #$t1 = limite inferior
addi $t2, $s1, 1    #$t2 = limite superior
add $t3, $zero, $s3 #$t3 = &vetor[0]
addi $t4, $zero, 0  #$t4 = i = 0
		    #$t5 = i < tamanho
		    #$t6 = vetor[i]

LOOP: slt $t5, $t4, $s4 #$t5 = $t4 < $s4 = i < tamanho
beq $t5, $zero, FIM     #if(i >= tamanho)

lw $t6, 0($t3)         #$t6 = vetor[i]
slt $s5, $t1, $t6      #$s5 = lim_inf <= vetor[i]
slt $s6, $t6, $t2      #$s6 = vetor[i] <= lim_sup
bne $s5, $s6, ITERACAO #if(!(lim_inf <= vetor[i] <= lim_sup))
addi $s2, $s2, 1       #$s2 = quantidade + 1

ITERACAO: addi $t4, $t4, 1 #$t4 = i + 1
sll $t3, $t4, 2   #$t3 = i * 4
add $t3, $t3, $s3 #$t3 = $t3 + $s3 = &vetor[i]
j LOOP

FIM: 
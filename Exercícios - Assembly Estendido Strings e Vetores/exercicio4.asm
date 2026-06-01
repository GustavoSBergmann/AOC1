.data
vetor: .word 1,2,3,4,5

.text
la $t0, vetor     #$t0 = 0x10010000 = &vetor[init]
la $t1, 0x10($t0) #$t1 = 0x10010010 = &vetor[end]
                  #$t2 = temp_init
                  #$t3 = temp_end
                  #$t4 = (&vetor[init] < &vetor[end])

LOOP:
slt $t4, $t0, $t1 #$t4 = (&vetor[init] < &vetor[end])
beqz $t4, FIM     #if(&vetor[init] >= &vetor[end])
lw $t2, 0($t0)    #$t2 = vetor[init]
lw $t3, 0($t1)    #$t3 = vetor[end]

sw $t2, 0($t1)    #vetor[end] = temp_init
sw $t3, 0($t0)    #vetor[init] = temp_end

addi $t0, $t0, 4 #&vetor[init] + 4
subi $t1, $t1, 4 #&vetor[end] - 4
j LOOP

FIM:
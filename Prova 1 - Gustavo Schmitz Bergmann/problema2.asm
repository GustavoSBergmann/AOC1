.data
inicio: .word 1  #0x10010000
N:      .word 10 #0x10010004
soma_pares:    .space 4 #0x10010008
numero_pares: .space 4 #0x1001000C
somatoirio:    .space 4 #0x10010010

.text
# Registrador Base
lui $t0, 0x1001 #$t0 = 0x10010000

# Saves
lw $s0, 0x0($t0)   #$s0 = inicio
lw $s1, 0x4($t0)   #s1 = N
add $s2, $s0, $s1  #$s2 = tamanho
addi $s3, $zero, 2 #$s3 = 2

# Temp
                   #$t1 = inicio < tamanho
addi $t2, $zero, 0 #$t2 = somatorio
		   #$t3 = inicio % 2
addi $t4, $zero, 0 #$t4 = soma_pares
addi $t5, $zero, 0 #$t5 = numero_pares


LOOP: slt $t1, $s0, $s2  #$t1 = inicio < tamanho
beq $t1, $zero, FIM      #if(inicio >= tamanho)
add $t2, $t2, $s0        #$t2 = somatorio += inicio (Tópico i)

div $s0, $s3             #inicio % 2
mfhi $t3                 #$t3 = inicio % 2
bne $t3, $zero, ITERACAO #if((inicio % 2) != 0)
add $t4, $t4, $s0        #$t4 = soma_pares (Tópico iv)
addi $t5, $t5, 1         #$t5 = numeros_pares (Tópico iii)

ITERACAO: addi $s0, $s0, 1 #$s0 = inicio += 1
j LOOP


FIM: sw $t2, 0x10($t0) #somatorio = $t2
     sw $t4, 0x08($t0) #soma_pares = $t4
     sw $t5, 0x0C($t0) #numero_pares = $t5
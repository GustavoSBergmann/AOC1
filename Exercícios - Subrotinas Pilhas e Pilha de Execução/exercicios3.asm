.text

li $a0, 0 # n = número de termos

jal fatorial
move $t1, $v0 # Armazena o resultado em $t1

# Encerra o programa
li $v0, 10
syscall

fatorial:
	# Armazena $ra na pilha
	subi $sp, $sp, 4
	sw $ra, ($sp)
	
	# Armazena n atual na pilha
	subi $sp, $sp, 4
	sw $a0, ($sp)
	
	ble $a0, 1, base #if(n <= 1)
	subi $a0, $a0, 1 # n = n - 1
	jal fatorial
	
	# Retira número da pilha
	lw $t0, ($sp)
	addi $sp, $sp, 4
	
	mul $v0, $v0, $t0 # Multiplica os números
	
	# Retira $ra da pilha
	lw $ra, ($sp)
	addi $sp, $sp, 4
	
	jr $ra
	
base:
	li $v0, 1 # Inicializa local do resultado
	
	# Retira número da pilha
	lw $t0, ($sp)
	addi $sp, $sp, 4
	
	# Retira $ra da pilha
	lw $ra, ($sp)
	addi $sp, $sp, 4
	
	jr $ra
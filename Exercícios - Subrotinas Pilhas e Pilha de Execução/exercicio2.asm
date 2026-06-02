.text

# Inicialização dos valores
li $t0, 150 #X = 150
li $t1, 230 #Y = 230
li $t2, 991 #Z = 991
li $t3, 0   #R = 0

# Armazena registradores T na pilha
subi $sp, $sp, 4
sw $t0, ($sp)
subi $sp, $sp, 4
sw $t1, ($sp)
subi $sp, $sp, 4
sw $t2, ($sp)

# Inicialização de argumentos
move $a0, $t0 # n1
move $a1, $t1 # n2
move $a2, $t2 # n3

jal soma3n
move $t3, $v0 # R = soma3n(X,Y,Z)

# Desarmazena registradores T da pilha
lw $t2, ($sp)
addi $sp, $sp, 4
lw $t1, ($sp)
addi $sp, $sp, 4
lw $t0, ($sp)
addi $sp, $sp, 4

# Finaliza o programa
li $v0, 10
syscall

soma3n:
	# Armazena $ra na pilha
	subi $sp, $sp, 4
	sw $ra, ($sp)
	
	#soma(n1, n2)
	jal soma
	
	move $a0, $a2 #A = n3
	move $a1, $v0 #B = soma(n2, n2)
	jal soma      #soma(n3, resultado)
	
	#Retira $ra da pilha
	lw $ra, ($sp)
	addi $sp, $sp, 4
	
	jr $ra

soma: 
	add $v0, $a0, $a1 # $v0 = A + B
	jr $ra
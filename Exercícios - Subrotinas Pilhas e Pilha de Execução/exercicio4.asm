.data
pi:         .float 3.14159265
div_triang: .float 2.0

menuStr:   .asciiz "Menu\n0-Circunferencia\n1-Triangulo\n2-Retangulo\nEscolha uma Opcao: "
str_r:     .asciiz "Insira o valor de r: "
str_a:     .asciiz "Insira o valor de a: "
str_b:     .asciiz "Insira o valor de b: "
resultado: .asciiz "Resultado: "
erro:      .asciiz "Opcao invalida!\n"

.text
#Imprime menu
la $a0, menuStr
li $v0, 4
syscall

#Lê opção e armazena em $t0
li $v0, 5
syscall
move $t0, $v0

#Decisão do menu
beq $t0, 0, circunferencia
beq $t0, 1, triangulo
beq $t0, 2, retangulo

#Opcao invalida
la $a0, erro
li $v0, 4
syscall

#Encerra o programa
fim:
li $v0, 10
syscall

circunferencia:
	#Lê valor de r
	la $a0, str_r
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	
	#Carrega $f1 com pi
	lwc1 $f1, pi
	
	#Calcula a área da circunferencia
	mul.s $f2, $f0, $f0 #r^2
	mul.s $f12, $f1, $f2 #pi*r^2
	
	#Imprime resultado
	la $a0, resultado
	li $v0, 4
	syscall
	li $v0, 2
	syscall
	
	j fim

triangulo:
	#Lê valor de a e armazena em $f1
	la $a0, str_a
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	#Lê valor de b e armazena em $f0
	la $a0, str_b
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	
	#Calcula a área de triângulo
	mul.s $f0, $f0, $f1 #a*b
	lwc1 $f1, div_triang
	div.s $f12, $f0, $f1  #(a*b)/2
	
	#Imprime resultado
	la $a0, resultado
	li $v0, 4
	syscall
	li $v0, 2
	syscall
	
	j fim
	
retangulo:
	#Lê valor de a e armazena em $f1
	la $a0, str_a
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	#Lê valor de b e armazena em $f0
	la $a0, str_b
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	
	#Calcula a área de triângulo
	mul.s $f12, $f0, $f1 #a*b
	
	#Imprime resultado
	la $a0, resultado
	li $v0, 4
	syscall
	li $v0, 2
	syscall
	
	j fim
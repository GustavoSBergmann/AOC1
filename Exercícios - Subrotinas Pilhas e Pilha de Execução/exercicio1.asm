.text 

#Lê valor 1
li $v0, 5
syscall
move $t0, $v0

#Lê valor 2
li $v0, 5
syscall
move $t1, $v0

#Lê valor 3
li $v0, 5
syscall
move $t2, $v0

#Inicia argumentos
move $a0, $t0
move $a1, $t1
move $a2, $t2

jal media #Chama subrotina

move $t5, $v0 #Armazenando no registrador $t5
move $a0, $v0 #Valor a ser impresso
li $v0, 1     #Código para imprimir inteiro
syscall       #Chama SO

#Finaliza o programa
li $v0, 10
syscall

media:
	li $t3, 3         #$t3 = 3
	
	add $t5, $a0, $a1 #somatorio = valor1 + valor2
	add $t5, $t5, $a2 #somatorio = valor1 + valor2 + valor3
	
	div $v0, $t5, $t3 #media = somatorio / 3
	
	jr $ra
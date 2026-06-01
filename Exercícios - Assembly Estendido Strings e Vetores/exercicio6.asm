.text
lui $t0, 0x1001 #$t0 = 0x10010000 = reg. base
		#$t1 = km
		#$t2 = litros
	 	#$t3 = km/l

LOOP:
li $v0, 5         #Código 5 = lê inteiro
syscall           #Chama o SO
move $t1, $v0     #$t1 = km
beqz $t1, FIM     #if(km == 0)

li $v0, 5         #Código 5 = lê inteiro
syscall           #Chama o SO
move $t2, $v0     #$t2 = litros

div $t3, $t1, $t2 #$t3 = km/l
sw $t3, ($t0)     #armazena resultado

addi $t0, $t0, 4 #reg. base + 4
j LOOP

FIM: li $v0, 10 #Código 10 = sai
syscall         #Termina programa
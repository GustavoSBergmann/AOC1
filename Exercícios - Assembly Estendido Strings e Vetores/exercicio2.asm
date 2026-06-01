.data
string: .asciiz "meu professor eh muito bom"

.text
la $t0 string  #$t0 = 0x10010000 = reg. base = read
	       #$t1 = string[read+1]
li $t2, 0x20   #$t2 = ' '(space)
lb $t3, 0($t0) #$t3 = string[read]

# Converte o primeiro
subi $t3, $t3, 0x20 #$t3 = upperCase($t3)
sb $t3, 0($t0)      #string[0] = $t3
addi $t0, $t0, 1    #read++

LOOP:
lb $t3, 0($t0)         #$t3 = string[read]
beqz $t3, FIM          #if(string[read] == \0)

bne $t3, $t2, ITERACAO #if(string[read] != ' ')
lb $t1, 1($t0)         #$t1 = string[read+1]

beq $t1, $t2, ITERACAO #if(string[read+1] == ' ')
subi $t1, $t1, 0x20    #$t1 = upperCase($t1)
sb $t1, 1($t0)         #string[read+1] = $t1

ITERACAO: addi $t0, $t0, 1 #read++
j LOOP

FIM:sb $zero, 0($t0) #Terminador '\0'
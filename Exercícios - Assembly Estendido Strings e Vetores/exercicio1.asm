.data
string: .asciiz "Gosto muito do meu professor de AOC-I."

.text
la $t0, string  #$t0 = 0x10010000 = reg. base = read
                #$t1 = string[read]
li $t2, 0x20    #$t2 = 0x20 = space
la $t3, string  #$t3 = 0x10010000 = reg. base = write

LOOP: 
lb $t1, 0($t0)         #$t1 = string[read]
beqz $t1, FIM          #if(string[read] == 0)
beq $t1, $t2, ITERACAO #if(string[read] == SPACE)
sb $t1, 0($t3)         #string[write] = string[read]
addi $t3, $t3, 1       #write++

ITERACAO: 
addi $t0, $t0, 1 #read++
j LOOP

FIM: sb $zero, 0($t3) #Terminador '\0'
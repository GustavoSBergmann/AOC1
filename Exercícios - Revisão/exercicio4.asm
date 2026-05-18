.data 
n: .word 5         #0x10010000
fatorial: .space 4 #0x10010004

.text
lui $t0, 0x1001    #$t0 = 0x10010000 = reg. base
lw $t1, 0($t0)     #$t1 = n
addi $t4, $zero, 0 #$t4 = 0
addi $t2, $t1, -1  #$t2 = n-1

LOOP: beq $t2, $zero, FIM #if($t2 == 0)
mult $t1, $t2       #$t1 * $t2
mflo $t1            #$t3 = $t1 * $t2
addi $t2, $t2, -1   #$t2 = $t2 - 1
j LOOP

FIM: sw $t1, 4($t0) #fatorial = $t1
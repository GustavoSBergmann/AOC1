.data
n: .word 6 #0x10010000
fatorial: .space 4 #0x10010004

.text
lui $t0, 0x1001    #$t0 = 0x10010000 = reg. base
lw $t1, 0($t0)     #$t0 = n
addi $t2, $zero, 1 #$t2 = 1

LOOP: beq $t1, $zero, FIM #if(n == 0)
mult $t1, $t2    #$t1 * $t2 = n * (n-1)
mflo $t2         #$t2 = n * (n - 1)
addi $t1, $t1 -1 #n -= 1
j LOOP

FIM:
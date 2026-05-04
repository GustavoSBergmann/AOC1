.data
x: .word 7  #0x10010000 = 7
y: .space 4 #0x10010004 = reservado

.text
lui $t0, 0x1001    #$t0 = 0x10010000
lw $t1, 0($t0)     #$t1 = 0x10010000 = 7 = termo
addi $t2, $zero, 1 #$t2 = fib(1) = 1
addi $t3, $zero, 1 #$t3 = fib(2) = 1
addi $t4, $zero, 2 #$t4 = 2 = contador

add $t5, $zero, $t2 #$t5 = 1
beq $t1, $t2, CASO1 #if($t1 == 1)
beq $t1, $t4, CASO1 #if($t1 == 2)

LOOP: add $t5, $t2, $t3 #$t5 = $t2 + $t3
add $t2, $zero, $t3     #$t2 = $t3
add $t3, $zero, $t5     #$t3 = $t4
addi $t4, $t4, 1         #$t4 += 1
bne $t4, $t1, LOOP      #if($t4 == $t1) LOOP

CASO1: sw $t5, 4($t0) #y = 0x10010000 = $t5

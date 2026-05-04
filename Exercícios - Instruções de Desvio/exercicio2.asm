.data
y: .space 4 #0x10010000 = reservado

.text
lui $t0, 0x1001      #$t0 = 0x10010000
addi $t1, $zero, 1   #$t1 = 1
addi $t2, $zero, 2   #$t2 = 2
addi $t3, $zero, 333 #$t3 = 333

LOOP: add $t1, $t1, $t2 #$t1 = $t1 + $t2
beq $t2, $t3, EXIT      #if($t2 == $t3)
addi $t2, $t2, 1        #$t2 = $t2 + 1
j LOOP                  #jump LOOP
EXIT: sw $t1, 0($t0)    #y = 0x10010000 = $t1
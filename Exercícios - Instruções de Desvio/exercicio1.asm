.data
a: .half 30 #0x10010000 = 30
b: .half 5  #0x10010002 = 5
y: .space 4 #0x10010004 = reservado

.text
lui $t0, 0x1001 #$t0 = 0x10010000
lh $t1, 0($t0)  #$t1 = 0x10010000 = a = 30
lh $t2, 2($t0)  #$t2 = 0x10010002 = b = 5

bne $t1, $t2, ELSE #if($t1 == $t2)
mult $t1, $t2 #$t1 * $t2
mflo $t3      #$t3 = $t1 * $t2
j EXIT
ELSE: div $t1, $t2 #$t1 / $t2
mflo $t3           #$t3 = $t1 / $t2
EXIT: sh $t3, 4($t0) #y = 0x10010004 = $t3
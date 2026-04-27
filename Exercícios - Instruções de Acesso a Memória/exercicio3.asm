.data
a: .word -3 #0x10010000 = -3
b: .word 7  #0x10010004 = 7
c: .word 5  #0x10010008 = 5
d: .word -2 #0x1001000C = -2
e: .word 8  #0x10010010 = 8
x: .word 4  #0x10010014 = 4
y: .space 4 #0x10010018 = reservado

.text
lui $t0, 0x1001   #$t0 = 0x10010000
lw $t1, 0x00($t0) #t1 = 0x00 + 0x10010000 = a
lw $t2, 0x04($t0) #t2 = 0x04 + 0x10010000 = b
lw $t3, 0x08($t0) #t3 = 0x08 + 0x10010000 = c
lw $t4, 0x0C($t0) #t4 = 0x0C + 0x10010000 = d
lw $t5, 0x10($t0) #t5 = 0x10 + 0x10010000 = e
lw $t6, 0x14($t0) #t6 = 0x14 + 0x10010000 = x

sub $t1, $zero, $t1 #$t1 = 0 - $t1 = 0 - (-3) = 3
mult $t1, $t6       #$t1 * $t6 = a * x
mflo $t1            #$t1 = $t1 * $t6
add $t1, $t1, $t2   #$t1 = $t1 + $t2 = (ax + b)

mult $t1, $t6       #$t1 * $t6 = (ax + b) * x
mflo $t1            #$t1 = $t1 * $t6
sub $t1, $t1, $t3   #$t1 = $t1 + $t3 = ((ax + b) * x - c)

mult $t1, $t6       #$t1 * $t6 = ((ax + b) * x - c) * x 
mflo $t1            #$t1 = $t1 * $t6
add $t1, $t1, $t4   #$t1 = $t1 + $t4 = (((ax + b) * x - c) * x + d)

mult $t1, $t6 	    #$t1 * $t6 = (((ax + b) * x - c) * x + d) * x
mflo $t1 	    #$t1 = $t1 * $t6
sub $t1, $t1, $t5   #$t1 = $t1 + $t5 = ((((ax + b) * x - c) * x + d) * x - e)

sw $t1, 0x18($t0)   #0x10010018 = $t1 = y
.text
addi $t1, $zero, 1 #$t1 = x = 1
addi $t2, $zero, 2 #$t2 = y = 2
addi $t3, $zero, 3 #$t3 = z = 3

addi $s0, $zero, 4 #$s0 = 4
addi $s1, $zero, 2 #$s1 = 2
addi $s2, $zero, 3 #$s2 = 3

mult $t1, $s0 #$t1*$s0
mflo $s0 #$s0 = 4x

mult $t2, $s1 #$t2*$s1
mflo $s1 #$s1 = 2y

mult $t3, $s2 #$t3*$s2
mflo $s2 #$s2 = 3z

sub $t4, $s0, $s1
add $t7, $t4, $s2
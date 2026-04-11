.text 
addi $t5, $zero, 2 #$t5 = x = 2
addi $s0, $zero, 3 #$s0 = 3
addi $s1, $zero, 5 #$s1 = 5
addi $s2, $zero, 13 #$s2 = 13

mult $t5, $t5 #$t5 * $t5 = x * x
mflo $t0 #$t0 = $t5 * $t5 = x^2

mult $s0, $t0 #$s0 * $t0 = 3 * x^2
mflo $s0 #$s0 = $s0 * $t0 = 3 * x^2

mult $s1, $t5 #$s1 * $t5 = 5 * x
mflo $s1 #$s1 = $s1 * $t5 = 5 * x

sub $t1, $s0, $s1 #$t1 = $s0 - $s1 = 3x^2 - 5x
add $t6, $t1, $s2 #$t6 = y = $t1 + $s2 = 3x^2 - 5x + 13
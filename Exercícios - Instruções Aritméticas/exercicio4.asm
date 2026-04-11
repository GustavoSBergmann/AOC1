# -----------------------------------------------------------------------
# Quando x = -4, teoricamente deveria ocorrer erro de divisão por zero,
# porém no meu software isso não ocorreu.
# -----------------------------------------------------------------------
.text
addi $t1, $zero, 2 #$t1 = x = 2
addi $s0, $zero, 9 #$s0 = 9
addi $s1, $zero, 7 #$s1 = 7
addi $s2, $zero, 2 #$s2 = 2
addi $s3, $zero, 8 #$s3 = 8

mult $s0, $t1 #$s0 * $t1 = 9 * x
mflo $s0 #$s0 = $s0 * $t1 = 9 * x

mult $s2, $t1 #$s2 * $t1 = 2 * x
mflo $s2 #$s2 = s2 * $t1 = 2 * x

add $t4, $s0, $s1 #$t4 = $s0 + $s1 = 9x + 7
add $t5, $s2, $s3 #$t5 = $s2 + $s3 = 2x + 8

div $t4, $t5 #$t4 / $t5 = (9x + 7)/(2x + 8)
mflo $t2 #$t2 = $t4 / $t5
mfhi $t3 #$t3 = $t4 % $t5

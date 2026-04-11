.text
addi $t0, $zero, 2 #$t0 = 2
addi $t1, $zero, 160 #$t1 = b = 160
addi $t2, $zero, 120 #$t2 = h = 120

mult $t1, $t2 #$t1 * $t2 = b * h
mflo $t4 #$t4 = $t1 * $t2 = b * h

div $t4, $t0 #$t4 / $t0 = (b * h) / 2
mflo $t3 #$t3 = $t4 / $t0 = (b * h) / 2
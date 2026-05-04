.text
ori $t0, $zero, 30 #$t0 = 30 = temperatura
ori $t4, $zero, 19 #$t2 = 20 = minFaixa1
ori $t5, $zero, 41 #$t3 = 40 = maxFaixa1
ori $t6, $zero, 59 #$t = 60 = minFaixa2
ori $t7, $zero, 81 #$t = 80 = maxFaixa2

slt $t5, $t0, $t5 #$t5 = ($t0 < $t5) = $t0 < 40
slt $t4, $t4, $t0 #$t4 = ($t4 < $t0) = 20 < $t0
and $t2, $t5, $t4 #$t2 = $t4 and $t5

slt $t7, $t0, $t7 #$t7 = ($t0 < $t7) = $t0 < 80
slt $t6, $t6, $t0 #$t6 = ($t6 < $t0) = 60 < $t0
and $t3, $t7, $t6 #$t3 = $t7 and $t6

xor $t1, $t2, $t3 #$t1 = $t2 xor $t3

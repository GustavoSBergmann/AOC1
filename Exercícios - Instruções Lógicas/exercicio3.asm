.text
ori $t1, $zero, 0x01 #$t1 = 0x01

sll $t2, $t1, 1 #$t2 = 0x02
or $t1, $t1, $t2 #$t1 = $t1 + $t2 = 0x01 + 0x02 = 0x03

sll $t2, $t1, 2 #$t2 = 0x0C
or $t1, $t1, $t2 #$t1 = $t1 + $t2 = 0x03 + 0x0C = 0x0F

sll $t2, $t1, 4 #$t2 = 0xF0
or $t1, $t1, $t2 #$t1 = $t1 + $t2 = 0x0F + 0xF0 = 0xFF

sll $t2, $t1, 8 #$t2 = 0xFF00
or $t1, $t1, $t2 #$t1 = $t1 + $t2 = 0x00FF + 0xFF00 = 0xFFFF

sll $t2, $t1, 16 #$t2 = 0xFFFF0000
or $t1, $t1, $t2 #$t1 = $t1 + $t2 = 0x0000FFFF + 0xFFFF0000 = 0xFFFFFFFF



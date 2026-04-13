.text
ori $t1, $zero, 0xAAAA #$t1 = 0xAAAA
sll $t1, $t1, 16 #$t1 = 0xAAAA0000

ori $t1, $t1, 0xAAAA #$t1 = 0xAAAAAAAA
srl $t2, $t1, 1 #$t2 = 0x55555555

or $t3, $t1, $t2 #$t3 = $t1 or $t2 = 0xFFFFFFFF
#(1010) or (0101) = 1111

and $t4, $t1, $t2 #$t4 = $t1 and $t2 = 0x00000000
#(1010) and (0101) = 0000

xor $t5, $t1, $t2 #$t5 = $t1 xor $t2 = 0xFFFFFFFF
#(1010) xor (0101) = 1111


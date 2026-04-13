.text
# Inicializa $t1 com 0x12345678
ori $t1, $zero, 0x1234 #$t1 = 0x1234
sll $t1, $t1, 16 #$t1 = 0x12340000
ori $t1, $t1, 0x5678 #$t1 = 0x12345678

# 8 - Início
andi $t3, $t1, 0xF #$t3 = $t1 and 0xF = 0x8
sll $t3, $t3, 28 #$t3 = 0x80000000
or $t2, $t2, $t3 #$t2 = $t2 or $t3 = 0x80000000

# 7
srl $t3, $t1, 4 #$t3 = 0x01234567
andi $t3, $t3, 0xF #$t3 = $t3 and 0xF = 0x7
sll $t3, $t3, 24 #$t3 = 0x07000000
or $t2, $t2, $t3 #$t2 = $t2 or $t3 = 0x87000000

# 6
srl $t3, $t1, 8 #$t3 = 0x00123456
andi $t3, $t3, 0xF #$t3 = $t3 and 0xF = 0x6
sll $t3, $t3, 20 #$t3 = 0x00600000
or $t2, $t2, $t3 #$t2 = $t2 or $t3 = 0x87600000

# 5
srl $t3, $t1, 12 #$t3 = 0x00012345
andi $t3, $t3, 0xF #$t3 = $t3 and 0xF = 0x5
sll $t3, $t3, 16 #$t3 = 0x00050000
or $t2, $t2, $t3 #$t2 = $t2 or $t3 = 0x87650000

# 4
srl $t3, $t1, 16 #$t3 = 0x00001234
andi $t3, $t3, 0xF #$t3 = $t3 and 0xF = 0x4
sll $t3, $t3, 12 #$t3 = 0x00004000
or $t2, $t2, $t3 #$t2 = $t2 or $t3 = 0x87654000

# 3
srl $t3, $t1, 20 #$t3 = 0x00000123
andi $t3, $t3, 0xF #$t3 = $t3 and 0xF = 0x3
sll $t3, $t3, 8 #$t3 = 0x00000300
or $t2, $t2, $t3 #$t2 = $t2 or $t3 = 0x87654300

# 2
srl $t3, $t1, 24 #$t3 = 0x00000012
andi $t3, $t3, 0xF #$t3 = $t3 and 0xF = 0x2
sll $t3, $t3, 4 #$t3 = 0x00000020
or $t2, $t2, $t3 #$t2 = $t2 or $t3 = 0x87654320

# 1 - Fim
srl $t3, $t1, 28 #$t3 = 0x00000001
andi $t3, $t3, 0xF #$t3 = $t3 and 0xF = 0x1
or $t2, $t2, $t3 #$t2 = $t2 or $t3 = 0x87654321


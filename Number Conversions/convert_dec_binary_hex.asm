# conversions quiz

.data
bin:	.ascii	"0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"
hex:	.asciiz	"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"
prp1: 	.asciiz " in binary is: "
prp2:	.asciiz	" in hex is: "
wlcm:	.asciiz "Welcome to the Decimal to Binary to Hex Converter"
prp0:	.asciiz	"\n\nEnter an integer 0-15, or 99 to quit: "
	.align	2
str:	.space	5

.text

	# print welcome
	li	$v0, 4
	la	$a0, wlcm
	syscall
	
loop:	# print prompt
	li	$v0, 4
	la	$a0, prp0
	syscall
	
	# read int
	li	$v0, 5
	syscall
	add	$s0, $0, $v0
	
	# check for 99
	beq	$s0, 99, exit
		
	# check for range
	blt	$s0, 0, loop
	bgt	$s0, 15, loop
	
	# get binary			# output binary
	add	$a0, $0, $s0
	la	$a1, bin
	jal	get_b
	add	$a0, $0, $v0
	
	# store as null terminated
	la	$t0, str
	sw	$v0, ($t0)
	sb	$0, 5($t0)
	
	# print integer, then message
	li	$v0, 1
	add	$a0, $0, $s0
	syscall
	li	$v0, 4
	la	$a0, prp1
	syscall 
	
	# print binary number
	li	$v0, 4
	add	$a0, $0, $t0
	syscall
	
	# output newline
	li	$v0, 11
	li	$a0, 0xa
	syscall
					# output hex
	# get hex
	add	$a0, $0, $s0
	la	$a1, hex
	jal	get_hex
	#add	$s1, $0, $v0
	
	# store as null terminated
	la	$t0, str
	sw	$v0, ($t0)
	
	# print integer, then message
	li	$v0, 1
	add	$a0, $0, $s0
	syscall
	li	$v0, 4
	la	$a0, prp2
	syscall 
	
	# print hex number
	li	$v0, 4
	la	$a0, str
	syscall
	
	j	loop
	

exit:	li	$v0, 10
	syscall
	
########### Get Binary #############
# a0 holds an integer in range 0-15
# a1 holds the binary array base address
# v0 will hold the binary equivalent in ascii
get_b:	
	sll	$t0, $a0, 2
	add	$t0, $t0, $a1
	lw	$v0, ($t0)
	jr	$ra

########### Get Hex #############
# a0 holds an integer in range 0-15
# a1 holds the hex array base address
# v0 will hold the hex equivalent in asciiz
get_hex:	
	sll	$t0, $a0, 1	# halfword offset
	add	$t0, $t0, $a1
	lh	$v0, ($t0)
	jr	$ra	

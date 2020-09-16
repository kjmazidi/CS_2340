# conversions quizlet
# selects a random binary number in range 0-15
# asks user for the decimal
# prints correct answer if wrong

.data
bin:	.ascii	"0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"
wlcm:	.asciiz "Welcome to the Binary Converter Quizlet!\nGuess 99 to exit"
prp1a:	.asciiz	"\n\nWhat is "
prp1b:	.asciiz	" in decimal? "
prp2: 	.asciiz "\nEnter your guess: "
pc:	.asciiz	"\nThat's correct!"
pw:	.asciiz "\nThe correct answer is: "
	.align	2
str:	.space	5	

.text
	# print welcome
	li	$v0, 4
	la	$a0, wlcm
	syscall
	
loop:	# get a random int [0, 15]
	li	$v0, 42
	li	$a0, 1
	li	$a1, 16
	syscall
	add	$s0, $0, $a0	# s0 is 0-15

	# display question part 1
	li	$v0, 4
	la	$a0, prp1a
	syscall
	
	# get binary and print it
	la	$t0, bin
	sll	$t1, $s0, 2	# binary = randInt*4 + addr(bin)
	add	$t0, $t0, $t1
	lw	$s1, ($t0)	# gett ascii string
	la	$t0, str
	sw	$s1, ($t0)	# write to buffer
	sb	$0, 5($t0)	# concat \0 to make it asciiz
	
	li	$v0, 4		# output the binary number
	la	$a0, str
	syscall
	
	# display question part 2
	li	$v0, 4
	la	$a0, prp1b
	syscall
	
	# get answer from user
	li	$v0, 5
	syscall
	add	$s2, $0, $v0
	
	# check if 99
	beq	$s2, 99, exit
	
	# check if correct
	bne	$s0, $s2, wrong
	li	$v0, 4
	la	$a0, pc
	syscall
	j	again
	
	# answer was wrong
wrong:	li	$v0, 4
	la	$a0, pw
	syscall
	li	$v0, 1
	add	$a0, $0, $s0
	syscall
	
again:	# keep playing
	j	loop

exit:	li	$v0, 10
	syscall
	


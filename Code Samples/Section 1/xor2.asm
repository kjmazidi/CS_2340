# xor cypher example

	.data
str:	.ascii	"hello !!"
encr:	.space	8
decr: 	.space	8

	.text
	la	$t0, str	
	lw	$t1, ($t0)	# load first 4 characters into $t1
	lw	$t2, 4($t0)	# load next 4 characters into $t2
	# print string
	li	$v0, 4
	la	$a0, str
	syscall
	# print newline
	li	$v0, 11
	li	$a0, 0xa 	# newline char
	syscall
	
	# encrypt
	li	$t9, 0xaaaaaaaa # $t0 holds key
	xor	$t1, $t1, $t9	# encrypt first 4 chars
	xor	$t2, $t2, $t9	# encrypt next 4 chars
	# save encryption
	la	$t0, encr
	sw	$t1, ($t0)
	sw	$t2, 4($t0)
	# print encrypted string
	li	$v0, 4
	la	$a0, encr
	syscall
	# print newline
	li	$v0, 11
	li	$a0, 0xa 	# newline char
	syscall
	
	# decrypt
	li	$t9, 0xaaaaaaaa # $t0 holds key
	xor	$t1, $t1, $t9	# encrypt first 4 chars
	xor	$t2, $t2, $t9	# encrypt next 4 chars
	# save decryption
	la	$t0, decr
	sw	$t1, ($t0)
	sw	$t2, 4($t0)
	# print decrypted string
	li	$v0, 4
	la	$a0, decr
	syscall
	# print newline
	li	$v0, 11
	li	$a0, 0xa 	# newline char
	syscall
	
	li	$v0, 10
	syscall

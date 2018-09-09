# practice program 5
# for (i=0; i<10; i++) a[i] +=5; 
	.data
a:	.word	5, 9, 2, 1, 4, 6, 3, 9, 2, 1
len:	.word	10

	.text
main:	la	$t1, a
	lw	$t2, len
	li	$t0, 0		# i = 0

loop:	beq $t0, $t2, exit
	lw	$t5, ($t1)	# $t5 = a[i]
	addi	$t5, $t5, 5
	sw		$t5, ($t1)
	addi	$t1, $t1, 4	# point to next word
	addi	$t0, $t0, 1
	j	loop

exit:	li	$v0, 10
	syscall
# simple loop example
# while (i < 3) i++;

	.data
n:	.word	3
count:	.word	0

	.text
	li	$t1, 0		# $t1 = i = 0
	lw	$t2, n		# $t2 = stop value

loop:	beq	$t1, $t2, done  # branch if i == 3
	addi	$t1, $t1, 1	# i++
	j	loop

done:	sw	$t1, count	# save i

exit:	li	$v0, 10
	syscall

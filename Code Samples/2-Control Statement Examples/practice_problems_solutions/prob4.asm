# practice program 4
# for (i=0; i<10; i++) c +=5;  
	.data
c:	.word	0

	.text
main:	lw	$t0, c
	li	$t1, 0		# i = 0
	li	$t2, 10		# stop at 10
loop:	bge	$t1, $t2, store	
	addi	$t0, $t0, 5	# c += 5
	addi	$t1, $t1, 1	# i++
	j	loop

store:	sw	$t0, c
exit:	li	$v0, 10
	syscall
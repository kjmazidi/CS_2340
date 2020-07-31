# practice program 3
# if (a <= b) c = b else c = a  
	.data
a:	.word	5
b:	.word	6
c:	.word	0

	.text
main:	lw	$t0, a
	lw	$t1, b	
	bgt	$t0, $t1, else
	sw	$t1, c
	j	exit
else:	sw	$t0, c

exit:	li	$v0, 10
	syscall
# simple add and sub examples

.data
a:   		.word	8
b:		.word	7
c:		.word	2
d:		.word	1
result1:	.word	9
result2:	.word 	9
.text
main:	
	# addi examples
	li	$t1, 2		# $t1 = 2
	addi	$t1, $t1, 3	# $t1 = 2 + 3
	addi	$t1, $t1, 5	# $t1 = 2 + 3 + 5
	sw	$t1, result1
	
	# implement the following C expression
	# result = (a + b) - (c + d)
	lw	$s1, a
	lw	$s2, b
	lw	$s3, c
	lw	$s4, d
	add	$t1, $s1, $s2
	add	$t2, $s3, $s4
	sub	$t0, $t1, $t2
	sw	$t0, result2
	
exit:	li	$v0, 10
	syscall

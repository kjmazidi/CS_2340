# branch example
# if (i == j) f = g+h; else f = g-h;

	.data
f:	.word		0
g:	.word		5
h:	.word		6
i:	.word		3
j:	.word		3

	.text
	lw	$s0, f		# load data
	lw	$s1, g
	lw	$s2, h
	lw	$s3, i
	lw	$s4, j
	
	bne	$s3, $s4, Else		# if i != j goto Else
	add	$s0, $s1, $s2		# if i == j add f + g
	j	Exit			# jump over else statement
Else:  	sub	$s0, $s1, $s2		# i != j so sub f - g

Exit:	li	$v0, 10
	syscall
	
	
	
	
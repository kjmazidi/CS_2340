# leaf function
# result = sum(x, y)

	.data
x:	.word	3
y:	.word	5
result:	.word	0

	.text
	lw	$a0, x
	lw	$a1, y
	jal	sum
	sw	$v0, result

exit:	li	$v0, 10
	syscall
	
sum:	# return x + y
	# x and y are in $a0 and $a0
	# sum is returned in $v0
	add	$v0, $a0, $a1
	jr	$ra
	
	

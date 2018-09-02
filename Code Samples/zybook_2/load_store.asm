# load store examples

.data
a:	.word   3
b:	.word	4
c:	.word   9
d:	.word   9
arr1:	.word	3, 4
arr2:	.word 	9, 9
.text
main:	# example 1
	# load a and b
	lw	$t1, a
	lw	$t2, b
	# store c and d
	sw	$t1, c
	sw	$t2, d
	
	# example 2
	la	$t1, arr1
	la	$t2, arr2
	lw	$t0, ($t1)	# copy first array element
	sw	$t0, ($t2)
	lw	$t0, 4($t1)	# copy second array element
	sw	$t0, 4($t2)
	
exit:	li	$v0, 10
	syscall

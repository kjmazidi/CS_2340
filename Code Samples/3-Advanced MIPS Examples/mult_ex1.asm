# calculate b^2 - 4ac
# assumes products <= 32 bits

	.data
a:	.word	10
b:	.word	15
c:	.word	3
result: .word	0

	.text
.globl  main
main:
	# load a, b, c
	lw	$s1, a
	lw	$s2, b
	lw	$s3, c
	li	$t0, 4
	
	mult	$s2, $s2	# b^2
	mflo	$t5	
	mult	$s1, $t0	# 4a
	mflo	$t3
	mult	$t3, $s3	# 4ac
	mflo	$t3
	
	sub	$t5, $t5, $t3	# b^2 - 4ac	
	sw	$t5, result

	# exit program	
exit:	li	$v0, 10
	syscall



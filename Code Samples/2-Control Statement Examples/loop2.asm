# looping through an array
# while (arr[i] != -1) i++;

	.data
arr:	.word	3, 8, 12, -1

	.text
	li	$s3, 0		# $s3 = i = 0
	la	$s6, arr	# $s6 = base address of array
	li	$s5, -1		# $t9 = k

loop:	sll	$t1, $s3, 2	# i = i * 4
	add	$t1, $t1, $s6	# address = i*4 + arr[0]
	lw	$t0, ($t1)	# get next array element
	beq	$t0, $s5, exit	# if arr[i] == -1, exit
  	addi	$s3, $s3, 1	# i++
  	j	loop		# goto next iteration
  	
exit:	li	$v0, 10
	syscall



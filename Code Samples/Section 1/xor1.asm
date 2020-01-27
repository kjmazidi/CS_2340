# demo xor swap


	.text
	li	$t1, 5
	li	$t2, 0xa
	
	# swap using add
	#add	$t3, $t1, $0	# temp = $t1
	#add	$t1, $t2, $0	# $t1 = $t2
	#add	$t2, $t3, $0	# $t2 - temp
	
	# swap using xor
	xor	$t1, $t1, $t2
	xor	$t2, $t1, $t2
	xor	$t1, $t1, $t2	
	
	
	li	$v0, 10
	syscall

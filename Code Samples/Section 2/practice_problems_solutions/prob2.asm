# practice program 2
# if (a > 0) a = -a
	.data
a:	.word	4	# change to negative to test


	.text
main:	lw	$t0, a
	ble 	$t0, $zero, exit
	sub	$t0, $zero, $t0	    # a = -a
	sw	$t0, a 	

exit:	li	$v0, 10
	syscall
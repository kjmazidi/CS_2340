# leaf function with arguments and push/pop
# function_leaf_args.asm
# purpose: demo how to use a and v registers, how to use stack

	.data
f:	.word	0
g:	.word	5
h:	.word	12
i: 	.word	4
j:	.word	3

	.text
	lw	$a0, g		# load arguments
	lw	$a1, h
	lw	$a2, i
	lw	$a3, j
	
	li	$s0, -1		# put something in $s0 for demo purposes
	# put something in $t0 and $t1 to demonstrate that 
	#    t registers are not preserved in a function call
	li	$t0, 9		
	li	$t1, 9
	
	jal	calc	
	sw	$v0, f		# save result from function call

exit:	li	$v0, 10
	syscall
	
calc:	# return (g + h) - (i + j)
	# g..j are in $a0..$a3
	# result is returned in $v0
	
	# push $s0 on stack
	addi	$sp, $sp, -4
	sw	$s0, ($sp)
	
	add	$t0, $a0, $a1
	add	$t1, $a2, $a3
	sub	$s0, $t0, $t1    # we could have used $v0 for Rd but use $s0 for demo purposes
	add	$v0, $s0, $zero
	
	# pop $s0 from stack
	lw	$s0, ($sp)
	addi	$sp, $sp, 4
	# return
	jr	$ra
	
	

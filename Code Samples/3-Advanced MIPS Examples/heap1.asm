# heap1.asm copy an array to the heap
.data
array:	.word	1, 2, 3, 4, 5
size:	.word	5
p:	.word	0		# pointer to copy of array in heap
.text
main:
	li	$v0, 9		#allocate
	li	$a0, 20		# 20 bytes
	syscall
	sw	$v0, p		# save pointer
	
	# loop through static array and copy to dynamic array
	la	$t1, array
	lw	$t2, p
	li	$t0, 0		# i = 0
	lw	$t3, size	# size of array
loop:	bge	$t0, $t3, exit
	lw	$t5, ($t1)	# get static array element
	sw	$t5, ($t2)	# copy to dynamic array
	addi	$t1, $t1, 4	# point to next word
	addi	$t2, $t2, 4	# point to next word
	addi	$t0, $t0, 1	# i++
	j	loop

# note: we did not deallocate the heap memory: BAD BAD BAD
	
exit:	li	$v0, 10
	syscall
	
	
	

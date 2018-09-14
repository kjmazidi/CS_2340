# implementing bubble sort (Chapter 2)
# void sort (int v[], int n)
# {
#    int i, j;
#    for (i=0; i<n; i+= 1) {
#        for (j=i-1; j>=0 && v[j] > v[j+1]; j=1) {
#            swap(v, j);
#        }
#    }
#}

	.data
array:	.word		19, 2, 95, 26, 83, 17, -5, 69, -16, 10
msg1:	.asciiz		"\nArray before sort: "
msg2:	.asciiz		"\nArray after sort: "

	.text
	la	$a0, msg1
	li	$v0, 4
	syscall			# print before message
	la	$a0, array
	li	$a1, 10
	jal	print
	la	$a0, array	# array pointer, v
	li	$a1, 10		# array size,  n
	jal	sort
	la	$a0, msg2	
	li	$v0, 4
	syscall			# print after message
	la	$a0, array
	li	$a1, 10
	jal	print
main:

	li	$v0, 10
	syscall
############################ PRINT ################################
# print an integer array 
# address in $a0
# length in $a1
print:	li	$t0, 0		# counter
	add	$t1, $zero, $a0 # pointer to words
loop:	beq	$t0, $a1, done
	li	$v0, 1		# print integer sevice call
	lw	$a0, ($t1)	# load next integer
	syscall			# print
	li	$v0, 11
	li	$a0, 0x20
	syscall			# print a space	
	addi	$t1, $t1, 4	# point to next word
	addi	$t0, $t0, 1	# add 1 to LCV
	j	loop
done:	jr	$ra
############################ SWAP ################################
swap:	sll	$t1, $a1, 2		# $t1 = k * 4
	add	$t1, $a0, $t1		# $t1 = v + (k * 4)
	lw	$t0, ($t1)		# load the two values
	lw	$t2, 4($t1)
	sw	$t2, ($t1)		# store (swap) the two values
	sw	$t0, 4($t1)
	jr	$ra
############################ SORT ################################
sort:	addi	$sp, $sp, -20	# push 5 registers onto stack
	sw	$ra, 16($sp)
	sw	$s3, 12($sp)
	sw	$s2, 8($sp)
	sw	$s1, 4($sp)
	sw	$s0, ($sp)
	move	$s2, $a0	# save $a0
	move	$s3, $a1	# save $a1
	# outer loop
	move	$s0, $zero	# i = 0
for1tst: slt	$t0, $s0, $s3	# check if i < n
	beq	$t0, $zero, exit1
	# inner loop
	addi	$s1, $s0, -1	# j = i - 1
for2tst: slti	$t0, $s1, 0	# check if j < 0
	bne	$t0, $zero, exit2
	sll	$t1, $s1, 2	# j * 4
	add	$t2, $s2, $t1	# v + j * 4
	lw	$t3, ($t2)	# v[j]
	lw	$t4, 4($t2)	# v[j+1]
	slt	$t0, $t4, $t3	# need to swap?
	beq	$t0, $zero, exit2
	# swap
	move	$a0, $s2
	move	$a1, $s1
	jal	swap
	addi	$s1, $s1, -1	# j --
	j	for2tst
	# end of inner loop
exit2: 	addi	$s0, $s0, 1	# i++
	j	for1tst
	# end of outer loop
exit1:	lw	$s0, ($sp)	# pop (restore) registers
	lw	$s1, 4($sp)
	lw	$s2, 8($sp)
	lw	$s3, 12($sp)
	lw	$ra, 16($sp)
	addi	$sp, $sp, 20
	jr	$ra	
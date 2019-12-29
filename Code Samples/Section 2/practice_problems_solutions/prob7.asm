# practice problem 7
# move the loop to a subroutine
# while (s2[i] = s1[i] != '/0') i++; 
	.data
s1:	.asciiz	"hi"
	.align	2
s2:	.space	4

	.text
main:	la	$t1, s1
	la	$t2, s2
	jal	copy

exit:	li	$v0, 10
	syscall
	
copy:

	lbu	$t5, ($t1)	# $t5 = s1[i]
	sb	$t5, ($t2)	# s2[i] = $t5
	beq	$t5, $zero, return
	addi	$t1, $t1, 1
	addi	$t2, $t2, 1	# i++
	j	copy
return:jr	$ra	
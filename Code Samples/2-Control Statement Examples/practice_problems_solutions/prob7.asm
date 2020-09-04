# practice problem 7
# move the loop to a subroutine
# while (s2[i] = s1[i] != '/0') i++; 
	.data
s1:	.asciiz	"hi"
	.align	2
s2:	.space	4

	.text
main:	la	$a1, s1
	la	$a2, s2
	jal	copy

exit:	li	$v0, 10
	syscall
	
copy:
	add	$t1, $a1, $0	# $t1 = s1[]
	add	$t2, $a2, $0	# $t2 = s2[]
loop:	lbu	$t5, ($t1)	# $t5 = s1[i]
	sb	$t5, ($t2)	# s2[i] = $t5
	beq	$t5, $zero, return
	addi	$t1, $t1, 1
	addi	$t2, $t2, 1	# i++
	j	loop
return:jr	$ra	

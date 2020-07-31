# MARS syscalls

.data
age:	.word	0
msg1:	.asciiz	"Please enter your age: "
msg2:	.asciiz "Your age is: "

.text
main:	
	# prompt user for age
	la	$a0, msg1
	li	$v0, 4
	syscall
	# get int from user
	li	$v0, 5
	syscall
	sw	$v0, age
	
	# echo data to user
	la	$a0, msg2
	li	$v0, 4
	syscall
	lw	$a0, age
	li	$v0, 1
	syscall
	
exit:	li	$v0, 10
	syscall


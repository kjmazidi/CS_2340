# Hello world
# Using MARS syscallas for outputting strings and reading strings

.data
name:	.space	20
prompt:	.asciiz	"Please enter your name: "
msg:	.asciiz "Hello "

.text
main:	
	# output prompt
	li	$v0, 4
	la	$a0, prompt
	syscall
	
	# input name
	li	$v0, 8
	li	$a1, 20
	la	$a0, name
	syscall
	
	# say hello
	li	$v0, 4
	la	$a0, msg
	syscall
	li	$v0, 4
	la	$a0, name
	syscall
	
exit:	li	$v0, 10
	syscall

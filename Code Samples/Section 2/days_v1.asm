# hackathon program 1, version 1

	.data
msg1:	.asciiz	"Number of days in month "
msg2:   .asciiz " is: "
msgerr: .asciiz "Month must be between 1 and 12\n"
msgent: .asciiz "Please enter the month 1 - 12, enter 0 to quit: "
	.text	
loop:	# get month from user
	la	$a0, msgent
	li	$v0, 4
	syscall
	li	$v0, 5
	syscall
	move	$t0, $v0
	# check for valid month
	beq	$t0, $zero, exit
	blt	$t0, 1, err
	bgt	$t0, 12, err
	# print msg1
	la	$a0, msg1
	li	$v0, 4
	syscall
	# print month
	move	$a0, $t0
	li	$v0, 1
	syscall
	# print msg2
	la	$a0, msg2
	li	$v0, 4
	syscall
	# print number of days
	move	$a0, $t0
	jal	days
	move	$a0, $v0
	li	$v0, 1
	syscall
	# print return
	li	$a0, 0x0a
	li	$v0, 11
	syscall
	# repeat
	j	loop
	
err:	# print error message
	la	$a0, msgerr
	li	$v0, 4
	syscall
	j	loop	
exit:	li	$v0, 10
	syscall	
	
days:	# return number of days
	li	$v0, 30		# default case
	beq	$a0, 4, ret
	beq	$a0, 6, ret
	beq	$a0, 9, ret
	beq	$a0, 11, ret
	# check for Feb
	bne	$a0, 2, set31
	li	$v0, 28
	j	ret
set31:  li	$v0, 31
ret:	jr	$ra

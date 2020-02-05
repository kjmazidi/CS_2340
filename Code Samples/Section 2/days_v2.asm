# days_v2.asm
# Karen Mazidi
# Program to output number of days for a given month
#  program does not handle leap years


	.data
month:	.asciiz	"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
day:	.word	31,    28,    31,    30,     31,    30,    31,    31,    30,    31,    30,    31
msg1:	.asciiz	"Number of days in "
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
	
	# check for valid month, 0 to exit
	beq	$t0, $zero, exit
	blt	$t0, 1, err
	bgt	$t0, 12, err
	
	# calculate offset for month
	mul	$t2, $t0, 4
	sub	$t2, $t2, 4
	
	# print "Number of days in month:"
	la	$a0, msg1
	li	$v0, 4
	syscall
	
	# print month
	la	$a0, month
	add	$a0, $a0, $t2
	li	$v0, 4
	syscall
	
	# print " is: "
	la	$a0, msg2
	li	$v0, 4
	syscall
	
	# print number of days
	move	$a0, $t0
	la	$a1, day
	jal	days
	move	$a0, $v0
	li	$v0, 1
	syscall
	
	# print line return
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
##############################################	
days:	# function to calculate array offset
	# $a0 is the month (1 - 12)
	# $a1 is the address of day array
	# return number of days in $v0
	mul	$t5, $a0, 4  # month*4bytes 
	sub	$t5, $t5, 4  # offset starts at 0
	add	$t5, $t5, $a1  # $t5 is address of days[month-1]
	lw	$v0, ($t5)
	jr	$ra

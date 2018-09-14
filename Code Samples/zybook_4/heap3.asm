# heap3.asm struct example
#struct {
#    int age;
#    char gender;
#    char class;  }
# 

	.data  
 p:	.word	0	# pointer to struct
 msga:	.asciiz	"\nAge = "
 msgg:  .asciiz "\nGender = "
 msgc:  .asciiz	"\nClass = "
 
 	.text
 main: 
 	# create a struct
 	li	$v0, 9
 	li	$a0, 8	 # age=4 + gender=1 + class=1 + 2 extra wasted bytes
 	syscall
 	sw	$v0, p	 # save pointer
 	move	$s1, $v0 # keep pointer in register
 	
 	# put data in struct
 	li	$t0, 23
 	sw	$t0, ($s1)  # age
 	li	$t0, 'M'
 	sb	$t0, 4($s1)  # gender
  	li	$t0, 'J'
 	sb	$t0, 5($s1)  # class	
 	
 	# print struct data
 	jal	print
 	
 exit:	li	$v0, 10
 	syscall
 	
############# print struct ###############
print:
	# print age
	li	$v0, 4
	la	$a0, msga
	syscall
 	lw	$a0, ($s1)
 	li	$v0, 1
 	syscall
	# print gender
	li	$v0, 4
	la	$a0, msgg
	syscall
 	lb	$a0, 4($s1)  #notice we load a byte 
 	li	$v0, 11
 	syscall
 	# print class
	li	$v0, 4
	la	$a0, msgc
	syscall
 	lb	$a0, 5($s1)
 	li	$v0, 11
 	syscall
	jr	$ra
 	

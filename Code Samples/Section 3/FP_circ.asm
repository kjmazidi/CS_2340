# FP example to compute the area of a circle
	.data
pi:	.double 	3.1415926535897924
rad:	.double	12.345678901234567
	.text 
main: 
	l.d	$f0, pi		# $f0 = pi
	l.d	$f4, rad	# $f4 = radius
	mul.d	$f12, $f4, $f4	# $f12 = rad^2
	mul.d	$f12, $f12, $f0	# $f12 = rad^2 * pi
	li	$v0, 3
	syscall
	
exit:			
	li $v0, 10 # terminate program
	syscall
	


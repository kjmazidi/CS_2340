# f2c1.asm
# program converts Fahrenheit temperature to Celsius
# C = (F - 32) * 5/9
	.data
const5:	.float	5.0
const9:	.float  9.0
const32:.float	32
fahr:	.float	72.0
celc:	.float	0
msgf:	.asciiz	"\nFahrenheit temperature of "
msgc:	.asciiz	" is equivalent to Celsius temp "
	.text
main:
	lwc1	$f12, fahr
	#lwc1	$f16, const5
	# or use these 3 instrucions:
	li	$t0, 5
	mtc1	$t0, $f16
	cvt.s.w	$f16, $f16
	# 
	# can't do this:
	#li	$f16, 5
	#cvt.s.w	$f16, $f16
	#
	lwc1	$f18, const9
	div.s	$f16, $f16, $f18    # $f16 = 5 / 9
	lwc1	$f18, const32
	sub.s	$f18, $f12, $f18    # $f18 = F - 32
	mul.s	$f0, $f16, $f18     # $f0 = (F - 32) * 5/9
	swc1	$f0, celc
	
	# display results
	li	$v0, 4	# print msgf
	la	$a0, msgf
	syscall
	li	$v0, 2
	lwc1 	$f12, fahr
	syscall
	li	$v0, 4	# print msgc
	la	$a0, msgc
	syscall
	li	$v0, 2
	lwc1	$f12, celc
	syscall
	
	# exit program	
exit:	li	$v0, 10
	syscall



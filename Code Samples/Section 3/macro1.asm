# macro1.asm demonstrates macro usage
# program converts Fahrenheit temperatures to Celsius
.include	"macro_file.asm"
	.data
const5:	.float	5.0
const9:	.float  9.0
const32:.float	32
fahr:	.float	72.0
celc:	.float	0
	.text
main:
	lwc1	$f12, fahr
	lwc1	$f16, const5
	lwc1	$f18, const9
	div.s	$f16, $f16, $f18
	lwc1	$f18, const32
	sub.s	$f18, $f12, $f18
	mul.s	$f0, $f16, $f18
	swc1	$f0, celc
	
	# display results
	print_str("\nFahrenheit temperature of ")
	lwc1 	$f12, fahr
	print_float($f12)
	print_str(" is equivalent to Celsius temp ")
	lwc1	$f12, celc
	print_float($f12)
	syscall
	
	# exit program	
exit:	li	$v0, 10
	syscall


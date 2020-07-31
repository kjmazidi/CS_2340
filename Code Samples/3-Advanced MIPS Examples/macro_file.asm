# file for macros

#### print_int ####  	print_int(4)	print_int($t0)
.macro print_int (%x)
    li 	$v0, 1
    add	$a0, $zero, %x
    syscall
.end_macro
#### print_gloat ####  	print_loat(4.2)	print_int($f0)
.macro print_float (%f)
    li 	$v0, 2
    mov.s $f12, %f
    syscall
.end_macro
#### print_str ####  	print_str("string in quotes")
.macro print_str (%str)
    .data
macro_str:	.asciiz %str
    .text
    li	$v0, 4
    la	$a0, macro_str
    syscall
.end_macro


# practice program 5
# for (i=0; i<10; i++) a[i] +=5; 
	.data
a:	.word	5, 9, 2, 1, 4, 6, 3, 9, 2, 1
len:	.word	10

	.text
main:	


exit:	li	$v0, 10
	syscall


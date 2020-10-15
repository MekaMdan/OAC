
.text
MAIN: 
	li a0,60
	
	jal RADIANO
	jal COS
	
	fmv.s fa0,fa1
	
	li a7,2
	ecall
	
	li a7,10
	ecall
	



.include"radi.s"
.include "cosseno.s"

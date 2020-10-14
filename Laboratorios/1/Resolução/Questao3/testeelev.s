MAIN: 
	li a0, 100
	jal FATORIAL
	
	mv a0,a1
	
	li a7,1
	ecall
	
	li a7,10
	ecall
	



.include"fatorial.s"

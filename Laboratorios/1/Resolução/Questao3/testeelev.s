
.text
MAIN: 
	li s1, 0
	li s0, 1080

LOOPTESTE:
	mv a0, s1
	jal RADIANO
	jal SENO
	
	fmv.s fa0,fa1
	
	li a7, 1
	ecall
	li a7, 11
	li a0, 32
	ecall
	li a7,2
	ecall
	li a7, 11
	li a0, 10
	ecall
	
	addi s1 s1 30
	bne s1 s0 LOOPTESTE
	
	li a7,10
	ecall
	



.include"radi.s"
.include "cosseno.s"

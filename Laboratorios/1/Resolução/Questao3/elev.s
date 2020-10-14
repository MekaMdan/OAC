# APENAS PARA NUMEROS INTEIROS POSITIVOS apenas 8 bits de respostas 
# elev(a0,a1)->a2
# a0 = X; a1 = N
# a2 = X^N (8 ultimos bits)
ELEVADO:
	addi sp,sp,-8
	sw ra,0(sp)
	sw t0,4(sp)
	
	# t0=n=1 -> a0
	li t0, 1
	# a2 = X^1
	add a2,a0,zero
	j LOOPELEV
	
LOOPELEV:
	bge t0,a1,ENDELEV
	mul a2,a2,a0 
	addi t0,t0,1
	j LOOPELEV

ENDELEV:
	lw ra,0(sp)
	lw t0,4(sp)
	addi sp,sp,8
	ret
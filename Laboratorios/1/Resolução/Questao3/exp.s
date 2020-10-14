.text


# EXPONENCIAL(fa0,a0) -> fa1
# fa0 = angulo (em radianos), a0 = exponencial
# fa1 = fa0^a0
EXPONENCIAL:
	addi sp,sp,-8
	sw ra,0(sp)
	sw t0, 4(sp)
	li t0,1
	fcvt.s.w fa1,t0
	mv t0,a0
	
	
LOOPEXPO:
	beq t0,	zero, FIMEXPO
	fmul.s fa1, fa0,fa1
	addi t0,t0,-1
	j LOOPEXPO
	
FIMEXPO:
	lw ra,0(sp)
	lw t0,4(sp) 
	addi sp,sp,8
	ret
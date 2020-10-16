.data
PI: .float 3.1415926536

.text
# radiano(a0) -> fa0
# a0 = angulo em graus
# fa0 = angulo em radianos
RADIANO:
	addi sp,sp,-12
	sw ra,0(sp)
	sw t3,4(sp)
	sw t0,8(sp)
	
	# angulo -> float
	fcvt.s.w ft0,a0
	
	flw ft1, PI t3
	
	fmul.s fa0,ft0,ft1 
	
	li t0,180
	fcvt.s.w ft0, t0
	
	fdiv.s fa0,fa0,ft0
	
	lw ra,0(sp)
	lw t3,4(sp)
	lw t0,8(sp)
	addi sp,sp,12
	ret


.text
# COS(a0) -> a1
# a0 -> angulo
# fa3 -> resultado do seno do angulo a0
COS:
	addi sp,sp,-28
	sw ra, 0(sp)
	sw t0, 4(sp)
	sw t1, 8(sp)
	sw t2, 12(sp)
	sw t3, 16(sp)
	sw t4, 20(sp)
	sw t5, 24(sp)
	
	li t0,1 # n-> varia de 0 até 100
	li t1,50 # controle de loop
	mv t2, a0 # move angulo para t2
	li t3, 2 
	li a3, 0
	
LOOPCOS:
	bgt t0,t1,FIMCOS

	li a0, -1 	
	mv a1, t0
	jal ELEVADO 		# a2 = (-1)^n
	mv t4, a2
	
	mv a0, t2               # a0 = angulo
	mul t5, t0,t3  		# a0 = n*2
	mv a1,t5
	jal ELEVADO		# angulo^(n*2)
	mul t4, t4, a2		# ((-1)^n) * (angulo^(n*2))
	
	mv a0,t5
	jal FATORIAL		# (n*2)! 
	
	fmv.s.x ft4,t4
	fmv.s.x ft1,a1
	fdiv.s  ft4,ft4,ft1		# ((-1)^n) * (angulo^(n*2))/(n*2)! 
	
	fadd.s  fa3,fa3,ft4
	addi t0,t0,1
	j LOOPCOS

FIMCOS:
	lw ra, 0(sp)
	lw t0, 4(sp)
	lw t1, 8(sp)
	lw t2, 12(sp)
	lw t3, 16(sp)
	lw t4, 20(sp)
	lw t5, 24(sp)
	addi sp,sp,28
	ret
	
.include "elev.s"
.include "fatorial.s"
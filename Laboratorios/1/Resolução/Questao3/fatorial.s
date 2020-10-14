#
# FATORIAL(a0)->a1
# a0 = n
# a1 = n!
FATORIAL:
	addi sp,sp,-12
	sw ra,0(sp)
	sw t0,4(sp) # n-1
	sw t1,8(sp) # para ser o fator de controle
	li t1,1 
	fmv.s.x fa1, a0
	addi t0,a0,-1
	
LOOPFATORIAL:
	ble t0,t1,ENDFATORIAL
	mul a1,a1,t0
	addi t0,t0,-1
	j LOOPFATORIAL

ENDFATORIAL:
	lw ra,0(sp)
	lw t0,4(sp)
	lw t1,8(sp)
	addi sp,sp,12
	ret

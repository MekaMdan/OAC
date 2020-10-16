.data
facts: .float 	-6.0 										# 3!
							 120.0 									# 5!
							-5040.0 								# 7!
							 362880.0 							# 9!
							-39916800.0							# 11!
							 6227020800.0						# 13!
							-1307674368000.0				# 15!
							 355687428096000.0			# 17!
							-121645100408832000.0		# 19!
							 51090942171709440000.0	# 21!

.text
# SENO(fa0) -> fa1
# fa0 -> angulo (em radiano)
# fa1 -> resultado do seno do angulo a0
SENO:
	addi sp,sp,-28
	sw ra,24(sp)
	sw s0,20(sp)
	sw s1,16(sp)
	fsw fs0,12(sp)
	fsw fs1,8(sp)
	fsw fs2,4(sp)
	fsw fs3,0(sp)
	
	li s0 10 							# contador (i)
	
	jal LIMITA
	
	fmv.s	fs0, fa0					# fs0 = angulo	(soma)
	fmv.s	fs2, fa0					# fs2 = angulo (produto)
	fmul.s	fs1, fa0, fa0 		# fs1 = angulo^2
	
	la s1 facts
	
LOOPSENO:
	fmul.s fs2, fs2, fs1 		# angulo^i * angulo*2
	
	flw 		fs3, 0(s1)				# carrega o fatorial (facts[i])
	fdiv.s fs3, fs2, fs3		# x^(2i-1)/(facts[i])
	
	fadd.s	fs0, fs0, fs3		# soma final
	
	addi s0, s0, -1
	addi s1, s1, 4
	bnez s0, LOOPSENO

	fmv.s fa1, fs0

	lw ra,24(sp)
	lw s0,20(sp)
	lw s1,16(sp)
	flw fs0,12(sp)
	flw fs1,8(sp)
	flw fs2,4(sp)
	flw fs3,0(sp)
	addi sp,sp,28
	ret

.include "limita.s"
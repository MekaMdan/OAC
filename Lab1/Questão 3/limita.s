.data
PI_:	.float		6.28318530718

.text
# limita(fa0: rad): fa0: rad
# limita rad em rad < PI
# assume que fa0 > 0
LIMITA:
	addi sp, sp,-20
	sw ra, 16(sp)
	sw s0, 12(sp)
	fsw fs0, 8(sp)
	fsw fs1, 4(sp)
	fsw fs2, 0(sp)
	
	flw fs0, PI_, t3 			# fs0 = ?
	li s0, -1
	fcvt.s.w fs2, s0
	
	fdiv.s fs1, fa0, fs0		# fs1 = rad / pi
	fcvt.w.s	t3, fs1				# 
	fcvt.s.w fs1, t3				# arredonda fs1
	fmul.s	fs1,	fs1, fs0
	fmadd.s fa0, fs1, fs2, fa0
	
	lw ra, 16(sp)
	lw s0, 12(sp)
	flw fs0, 8(sp)
	flw fs1, 4(sp)
	flw fs2, 0(sp)
	addi sp, sp, 20
	ret
	
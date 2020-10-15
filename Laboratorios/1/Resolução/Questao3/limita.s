.data
PI_:	.float		3.1415926535972

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
	li s0, -2
	fcvt.s.w fs2, s0
	
	flt.s t3, fa0, fs0
	fcvt.s.w fs1, t3
	fmul.s	fs1,	fs1, fs2
	fmadd.s fa0, fs1, fs0, fa0
	
	lw ra, 16(sp)
	lw s0, 12(sp)
	flw fs0, 8(sp)
	flw fs1, 4(sp)
	flw fs2, 0(sp)
	addi sp, sp, 20
	ret
	
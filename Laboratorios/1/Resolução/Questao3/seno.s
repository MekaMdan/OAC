# 3! = 6 | 5! = 120 | 
.data
sete: .float 5040
cinco: .float 120
tres: .float 6
nove: .float 362880

.text
# SENO(fa0) -> fa1
# fa0 -> angulo (em radiano)
# fa1 -> resultado do seno do angulo a0
SENO:
	addi sp,sp,-12
	sw ra,0(sp)
	sw t0,4(sp)
	sw t3,8(sp)
	
	#fa0 -> ang; a0-> exp
	li a0,3
	jal EXPONENCIAL
	
	flw ft1,tres t3
	fdiv.s ft0, fa1, ft1 # x^3/3!
	
	fsub.s ft2, fa0, ft0 # x - (x^3)/3!
	
	#fa0 -> ang; a0-> exp
	li a0,5
	jal EXPONENCIAL
	
	flw ft1,cinco t3
	fdiv.s ft0, fa1, ft1 # x^5/5!
	
	fadd.s ft2,ft2,ft0 #  x - ((x^3)/3!) + ((x^5)/5!)
	
	#fa0 -> ang; a0-> exp
	li a0,7
	jal EXPONENCIAL
	
	flw ft1,sete t3
	fdiv.s ft0, fa1, ft1 # x^7/7!  
	fsub.s ft2,ft2,ft0   #  x - ((x^3)/3!) + ((x^5)/5!) - (x^7/7!) 
	
	#fa0 -> ang; a0-> exp
	li a0,9
	jal EXPONENCIAL
	
	flw ft1,nove t3
	fdiv.s ft0, fa1, ft1 # x^9/9!
	
	fadd.s ft2,ft2,ft0 #  x - ((x^3)/3!) + ((x^5)/5!) - (x^7/7!) + - (x^9/9!) 
	
	fmv.s fa1,ft2
	
	lw ra,0(sp)
	lw t0,4(sp)
	lw t3,8(sp)
	addi sp,sp,12
	ret
	
	
.include "exp.s"
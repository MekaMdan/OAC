.data
PISOB2: .float 1.570796327

.text
# COS(fa0) -> fa1
# fa0 -> angulo em radiano
# fa1 -> resultado do seno do angulo a0
COS:
	addi sp,sp,-8
	sw ra,0(sp)
	sw t3,4(sp)
	
	flw ft1, PISOB2 t3
	fadd.s fa0,fa0,ft1
	jal SENO
	
	lw ra,0(sp)
	lw t3,4(sp)
	addi sp,sp,8
	ret
	
.include "seno.s"
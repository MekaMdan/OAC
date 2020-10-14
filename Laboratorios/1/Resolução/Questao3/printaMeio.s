# ponto mediano: (160,120)
# Printa o plano cartesiano



#PRINTMEIO() 
PRINTAMEIO:
	addi sp,sp,-20
	sw ra,0(sp)
	sw a4, 4(sp)
	sw t0, 8(sp)
	sw t1, 12(sp)
	sw t2, 16(sp)
	li a4,0x0
# printa eixo x
PRINTAMEIOX:
	li t0,0 #pixel inicial do eixo x
	li t1,120 # coordenada eixo y
	li t2, 320 # pixel final do eixo x
	j LOOPEIXOX
	
LOOPEIXOX:
	bgt t0,t2,PRINTAMEIOY
	addi sp,sp,-4
	sh t0,0(sp) # a0 designa os 2 primeiros bits para x
	sh t1,2(sp) # a0 designa os 2 ultimos bits para y
	add a0,sp,zero
	jal printaPonto
	addi sp,sp,4
	addi t0,t0,1
	j LOOPEIXOX
# printa eixo y	
PRINTAMEIOY:
	li t0,0 # pixel inicial do eixo y
	li t1, 160 # coordenada eixo x
	li t2, 240 # pixel final do eixo y
	j LOOPEIXOY

LOOPEIXOY:
	bgt t0,t2,ENDPRINTARMEIO # se y for maior que o pixel final 
	addi sp,sp,-4
	sh t1,0(sp)
	sh t0,2(sp)
	add a0,sp,zero
	jal printaPonto
	addi sp,sp,4
	addi t0,t0,1
	j LOOPEIXOY
	

ENDPRINTARMEIO:
	lw ra,0(sp)
	lw a4,4(sp)
	lw t0, 8(sp)
	lw t1, 12(sp)
	lw t2, 16(sp)
	addi sp,sp,20
	ret
	
.include "printaPonto.s"
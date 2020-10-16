.include "MACROSv21.s"

.text

MAIN:
	# limpa a tela
	li a7,141
	ecall
	li a7,148
	li a1,0
	ecall
	
	li a7,47
	# desenha eixo y
	li a0,0
	li a1,120
	li a2,320
	li a3,120
	ecall
	
	# desenha eixo x
	li a0,160
	li a1,0
	li a2,	160
	li a3,240
	ecall
	#jal LER #retorna valores a0(raio), a1(angulo) e a2(lados)
	

	li s9	360	# n maximo angulo
	li s10	15 	# lados maximo
	li s7 	0	# contador (angulo)

ANGULO:
	li s11 	3	# contador n lados
LADOS:
	li a0 100
	mv a1 s7
	mv a2 s11
		
	csrr s2,3073   # le o time atual
	
	jal VERTICES
	mv a0, a3 	
	jal DESENHA
	
	csrr t0,3073   # le o time atual
	sub s0,t0,s2   # calcula o tempos
	
	jal SHOWINFO
	
	addi s11 s11 1
	blt s11 s10 LADOS
	addi s7 s7 15
	blt s7 s9 ANGULO
	
	#Final
	li a7,10
	ecall

SHOWINFO:
# printa o raio
	li a7 1
	li a0 100
	ecall
#	printa espaco
	li a7 11
	li a0 32
	ecall
# printa o angulo
	li a7 1
	mv a0 s7
	ecall
#	printa espaco
	li a7 11
	li a0 32
	ecall
# printa o n lados
	li a7 1
	mv a0 s11
	ecall
#	printa espaco
	li a7 11
	li a0 32
	ecall
# printa o time
	li a7 1
	mv a0 s0
	ecall
# printa o newline
	li a7 11
	li a0 10
	ecall
	
	ret

.include "ler.s"
.include "pintarTela.s"
.include "printaMeio.s"
.include "botaponto.s"
.include "desenha.s"


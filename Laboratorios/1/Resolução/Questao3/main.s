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
	
	# jal LER #retorna valores a0(raio), a1(angulo) e a2(lados)
	li a7, 42
	li	 a1 110
	ecall
	addi s0 a0 10
	
	li	 a1 360
	ecall
	addi s1 a0 0
	
	li	 a1 12
	ecall
	addi s2 a0 3
	
	mv a0 s0
	mv a1 s1
	mv a2 s2
	
	jal VERTICES
	mv a0, a3 	
	jal DESENHA
	
	li a7 32
	li a0 1000
	ecall
	
	jal MAIN

	
	#Final
	li a7,10
	ecall
	
	ret

.include "ler.s"
.include "pintarTela.s"
.include "printaMeio.s"
.include "botaponto.s"
.include "desenha.s"


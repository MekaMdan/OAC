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
	
	jal LER #retorna valores a0(raio), a1(angulo) e a2(lados)

	jal VERTICES
	
	mv a0, a3 #
	
	jal DESENHA
	
	#Final
	li a7,10
	ecall
	
	
.include "ler.s"
.include "pintarTela.s"
.include "printaMeio.s"
.include "botaponto.s"
.include "desenha.s"

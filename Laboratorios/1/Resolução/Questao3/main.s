.text

MAIN:
	jal COLORIR_TELA
	jal PRINTAMEIO
	jal LER #retorna valores a0(raio), a1(angulo) e a2(lados)
	
	#Final
	li a7,10
	ecall
	
	
.include "ler.s"
.include "pintarTela.s"
.include "printaMeio.s"
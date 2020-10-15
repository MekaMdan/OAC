.text

# printaPonto(a0, a4)
# a0 -> Endereo NA PILHA de ponto na forma xxxxyyyy
# a4 -> cor
printaPonto:
	# guarda na pilha o valor anterior das variaveis usadas durante a funo
	addi sp,sp, -24
	sw ra, 0(sp) 
	sw t0, 4(sp)
	sw t1, 8(sp)
	sw t2, 12(sp)
	sw t3, 16(sp)
	sw t6, 20(sp)
	
#codigo da funo
	# t0 -> Endereo inicial que pode mudar de 0xFF000000 ou 0xFF100000 dependendo da FRAME
	li t0,0XFF000000
	j PrintarPontoTela
PrintarPontoTela:
	li t6, 320
	# t1 -> x
	lh t1, 0(a0)
	# t2 -> y
	lh t2, 2(a0)
	# t3 -> t0(endereo inicial) + x
	add t3, t0, t1
	# t2 -> y*320
	mul t2, t2, t6
	# t3 -> t3+t2 = Endereo_inicial + y*320 + x	
	add t3,t3,t2
	
	sb a4,0(t3)
	
	#recupera na pilha o valor anterior das variaveis usadas durante a funo e retorna
	lw ra, 0(sp)
	lw t0, 4(sp)
	lw t1, 8(sp)
	lw t2, 12(sp)
	lw t3, 16(sp)
	lw t6, 20(sp)
	addi sp,sp,24
	ret

.text

BRANCA_TELA:
	addi sp,sp,-4		# aloca pilha
	sw ra,0(sp)		# guarda o valer do end de retorno
	li t1,0xFF000000	# FRAME 0 da memoria VGA - endereo inicial
	li t2,0xFF012C00	# endereco final 
	li t3,0xFFFFFFFf	# cor branca
	j LOOPTELABRANCA		# cor branca
LOOPTELABRANCA:	
	sw t3,0(t1)		#armazena no end da tela  		
	addi t1,t1,4		
	beq t1,t2,PRINTATELA	#sai do loop
	j LOOPTELABRANCA
PRINTATELA:
	lw ra, 0(sp)
	addi sp,sp,4		# retorna pro end inicial e desaloca a pilha
	ret			# ret


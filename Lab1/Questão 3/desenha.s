

# void desenha(int *V), onde V:
# V[0] -> n lados dem um poligono regular
# V[2i], 0 < i < n -> coordenada x de um vertice
# V[2i-1], 0 < i < n -> coordenada y de um vertice
# a0: *V
DESENHA:
	addi sp,sp,-4
	sw ra,(sp)
	
	mv s0, a0
	
	lw s1, 0(s0)		# n lados
	
	li s2, 0				# contador
	addi s0, s0, 4	# indice inicial
	mv s3, s0

	
	li a4,0xff
 	li a5,0
	li a7,47
LOOPDESENHA:
	
	lw a0, 0(s3)
	lw a1, 4(s3)
	
	addi s2, s2, 1
	rem s2, s2, s1		# s2 = s2 % n lados (dar uma volta no circulo)
	slli t0, s2, 3		# multiplica por 2 (2 enderecos) e alinha com as palavras (*8) 
	add s3, s0, t0	# indice pra buscar no vetor
	
	lw a2, 0(s3)
	lw a3, 4(s3)

	ecall
	
	bnez s2, LOOPDESENHA


	sw ra,(sp)
	addi sp,sp,4
	ret
	

.include "SYSTEMv21.s"
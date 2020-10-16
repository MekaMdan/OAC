.data
V: .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
DOISPI: .float 6.2831853

# ponto mediano: (160,120)

.text
# VERTICES(a0,a1,a2) -> a3
# a0 -> raio; a1-> angulo; a2-> lados
# a3 -> endereco do vetor
VERTICES:
	addi sp,sp,-8
	sw ra,4(sp)
	sw s2,0(sp)
	
	mv t0,a2   # t0 = lados 	
	li t1, 0	
	mv t2, a0  # t2 = raio
	li t4, 160 # x_centro
	li t5, 120 # y_centro
	
	la t6, V   # Vetor
	mv a3,t6   # vetor d novo
	
	sw t0, 0(a3) # coloca lados no vetor
	addi t6,t6,4
	
	flw fs1, DOISPI t3
	
	fcvt.s.w ft1, t0
	
	fdiv.s fs1,fs1,ft1    	# incremento de angulo -> 2PI/N
	
	mv a0,a1		# a0 = angulo
	
	jal RADIANO		# converte angulo para radiano -> retorna fa0
	
	fmv.s fs2, fa0 		# salva angulo(em radiano) no fs2
	
	fcvt.s.w fs3,t2		# converte raio para float
LOOPVERTICE: 
	beq t1,t0,FIM		# N = 1
	fmv.s fa0,fs2		# move angulo para fa0
			
	# x -> s2
	
	jal COS			# envia para o cos o fa0 e recebe em fa1	
	fmul.s fa1,fa1,fs3 	# raio*cos(angulo)
	fcvt.w.s s2,fa1 	# converte raio*cos em int
	add s2,t4,s2		# x_centro + raio * cos(angulo)
	sw s2,0(t6)		# guarda x no vetor
	
	# y -> s3
	fmv.s fa0,fs2		# move angulo para fa0
	jal SENO		# envia para o cos o fa0 e recebe em fa1
	fmul.s fa1,fa1,fs3	# raio*sen(angulo)
	fcvt.w.s s2,fa1		# converte raio*sen
	add s2,t5,s2		# y_centro + raio*sen
	sw s2,4(t6)		# guarda y no vetor
	
	
	# fim do loop
	fadd.s fs2, fs2, fs1 	# angulo = angulo + incremento_angulo
	addi t1,t1,1		# incrementa t1
	addi t6,t6,8		# Incrementa o end em t6 para armazenar x e y
	j LOOPVERTICE
	
	

FIM:
	lw s2,0(sp)
	lw ra,4(sp)
	addi sp,sp,8
	ret 
	
.include "radi.s"
.include "cosseno.s"	

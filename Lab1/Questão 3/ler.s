.data
	raio_msg:   	.string "Digite o raio(10<r<120):"
	angulo_msg: 	.string "Digite o angulo(0<=a<=360):"
	lados_msg:	.string "Digite a quantidade de lados(p>2):"
.text

# LER()-> a0,a1,a2
# a0 = raio
# a1 = angulo
# a2 = lados
LER:
	#salva na pilha os valores dos registradores temporarios
	addi sp,sp,-8
	sw ra, 0(sp)
	sw t0, 4(sp)
	
	#printa raio_msg
	li a7,4
	la a0, raio_msg
	ecall
	
	#le o valor de raio
	li a7,5
	ecall
	mv t0,a0		# atribui o valor de raio temporariamente ao reg t0
	
	#printa angulo_msg
	li a7,4
	la a0, angulo_msg
	ecall
	
	#le o valor de angulo
	li a7,5
	ecall
	mv a1,a0 		# atribui o valor de angulos ao reg a1
	
	#printa lados_msg
	li a7,4
	la a0, lados_msg
	ecall
	
	#le o valor de lados
	li a7,5
	ecall
	mv a2,a0 		# atribui valor de lados ao reg a2
	
	mv a0,t0 		# atribui valor de raio ao a0
	
	#recupera valores dos registradores temporarios
	lw ra,0(sp)
	lw t0,4(sp)
	addi sp,sp,8
	
	ret
.eqv N 30 #atribuição da variável N, o numero de elementos do array

.data
Array:  .word 	9,2,5,1,8,2,4,3,6,7,10,2,32,54,2,12,6,3,1,78,54,23,1,54,2,65,3,6,55,31

.text	

INSERTION_SORT:
	la s2,Array #salva o endereço inicial do array em s2
	li s3,N #salva N em s3
	add s0,zero,zero #inicializa o contador s0 com valor 0
for1:	bge s0,s3,SHOW #se o contador for maior ou igual ao o tamanho do vetor N, printar os valores na tela
	addi s1,s0,-1 #arr[s1], onde a cada iteração de for1 é setado como s0-1
for2:	blt s1,zero,next #se s1 for menor que 0, ir para a função next (s1 menor que 0 nao corresponde a nenhum elemento do vetor)
	slli t1,s1,2 #salvar em t1 o número do elemento do vetor em que estamos trabalhando multiplicado por 4 (pois cada elemento tem 4 bytes)
	add t2,s2,t1 #salvar em t2 o valor do endereço do vetor + o valor salvo em t1 
	lw t3,0(t2) #salvar em t3 o valor do vetor na posição atual
	lw t4,4(t2) #salvar em t4 o valor do vetor na próxima posição
	bge t4,t3,next #se o valor em t4 for maior ou igual ao valor em t3, vai para a função next pois o sub-vetor ja está ordenado
	add a0, zero, s2 #atribui o endereço inicial do vetor para a0
	add a1, zero, s1 #atribui o número sobre qual elemento do vetor estamos trabalhando para a1
	jal SWAP
	addi s1,s1,-1 #após trocar os números, começamos a operar sobre o valor anterior
	j for2
next:	addi s0,s0,1 #adicionar 1 ao valor do contador s0
	j for1
	
SWAP:	slli t1,a1,2 #salvar em t1 o número qual elemento do vetor estamos trabalhando multiplicado por 4 (pois cada elemento tem 4 bytes)
	add t1,a0,t1 #guardamos em t1 o valor da memoria para o elemento que queremos trabalhar + o offset calculado na linha anterior
	lw t0,0(t1) #invertemos o valor da posição i com o de i+1
	lw t2,4(t1)
	sw t2,0(t1)
	sw t0,4(t1)
	ret
	
SHOW:	mv t0,s2 #atribui o endereço inicial do vetor para t0
	mv t1,s3 #atribui o tamanho do vetor N para t1
	mv t2,zero #inicializa o contador t2 com valor 0
loop1: 	beq t2,t1,break #se o contador t2 for igual ao tamanho do vetor N em t1, chama a rotina break
	li a7,1 #chama a syscall para printar um inteiro
	lw a0,0(t0) #printa o valor do vetor na posição atual
	ecall
	li a7,11 #chama a syscall para printar um caractere ASCII
	li a0,32 #printa um "espaço"
	ecall
	addi t0,t0,4 #avança para o proximo elemento do vetor
	addi t2,t2,1 #adiciona 1 ao contador t2
	j loop1
break:	li a7,11 #chama a syscall para printar um caractere ASCII
	li a0,10 #printa uma "quebra de linha"

exit: 	li a7,10 #chama a rotina de saída
	ecall

.data
.LANCHOR0: .word   9
        .word   2
        .word   5
        .word   1
        .word   8
        .word   2
        .word   4
        .word   3
        .word   6
        .word   7
        .word   10
        .word   2
        .word   32
        .word   54
        .word   2
        .word   12
        .word   6
        .word   3
        .word   1
        .word   78
        .word   54
        .word   23
        .word   1
        .word   54
        .word   2
        .word   65
        .word   3
        .word   6
        .word   55
        .word   31
.text
	call main
	li a7 10
	ecall
show:
         mv     t0,a0 
         mv     t1,a1 
         mv     t2,zero 
loop1:  
beq     t2,t1,fim1 
        li      a7,1 
        lw      a0,0(t0) 
        ecall 
        li      a7,11 
        li      a0,9 
        ecall 
        addi    t0,t0,4 
        addi    t2,t2,1 
        j       loop1 
fim1: 
        li      a7,11 
        li      a0,10 
        ecall 

        ret
swap:
        slli    a1,a1,2
        addi    a5,a1,4
        add     a5,a0,a5
        lw      a3,0(a5)
        add     a0,a0,a1
        lw      a4,0(a0)
        sw      a3,0(a0)
        sw      a4,0(a5)
        ret
sort:
        blez    a1,.L4
        li      a7,0
        addi    t3,a1,-1
        li      a6,-1
        mv      a4,a7
        beq     a7,t3,.L4
.L10:
        lw      a3,0(a0)
        lw      a2,4(a0)
        addi    t1,a0,4
        mv      a1,t1
        mv      a5,a0
        bgt     a3,a2,.L9
        j       .L8
.L12:
        lw      a3,-4(a5)
        lw      a2,0(a5)
        addi    a0,a0,-4
        addi    a5,a5,-4
        addi    a1,a1,-4
        ble     a3,a2,.L8
.L9:
        sw      a2,0(a0)
        sw      a3,0(a1)
        addi    a4,a4,-1
        bne     a4,a6,.L12
.L8:
        addi    a7,a7,1
        mv      a0,t1
        mv      a4,a7
        bne     a7,t3,.L10
.L4:
        ret
main:
        addi    sp,sp,-16
        sw      s0,8(sp)
        lui     s0,%hi(.LANCHOR0)
        addi    a0,s0,%lo(.LANCHOR0)
        li      a1,30
        sw      ra,12(sp)
        call    show
        addi    a0,s0,%lo(.LANCHOR0)
        li      a1,30
        call    sort
        addi    a0,s0,%lo(.LANCHOR0)
        li      a1,30
        call    show
        lw      ra,12(sp)
        lw      s0,8(sp)
        li      a0,0
        addi    sp,sp,16
        jr      ra
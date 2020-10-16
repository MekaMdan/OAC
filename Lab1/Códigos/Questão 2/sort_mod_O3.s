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
        lw      a4,-4(a5)
        lw      a5,0(a5)
        add     a0,a0,a1
        sw      a4,4(a0)
        sw      a5,0(a0)
        ret
sort:
        blez    a1,.L16
        li      t3,1
        li      a3,0
        li      t1,-1
        beq     a1,t3,.L17
.L7:
        slli    a5,a3,2
        addi    a4,a5,4
        add     a4,a0,a4
        add     a5,a0,a5
        lw      a2,0(a5)
        lw      a7,0(a4)
        mv      a6,a5
        bgt     a2,a7,.L10
        j       .L9
.L18:
        lw      a2,-4(a5)
        addi    a6,a6,-4
        addi    a5,a5,-4
        addi    a4,a4,-4
        ble     a2,a7,.L9
.L10:
        sw      a7,0(a6)
        sw      a2,0(a4)
        addi    a3,a3,-1
        bne     a3,t1,.L18
.L9:
        addi    a5,t3,1
        mv      a3,t3
        beq     a1,a5,.L19
        mv      t3,a5
        j       .L7
.L17:
        ret
.L19:
        ret
.L16:
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
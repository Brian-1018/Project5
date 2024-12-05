.data
.text
.globl main
main:
    addi $s0, $0, 95 #_ ASCII
    addi $s1, $0, 43 #+ ASCII
    addi $s2, $0, 45 #- ASCII
    addi $s3, $0, 47 #/ ASCII
    addi $s4, $0, 42 #* ASCII
    addi $s5, $0, 0

Calc_loop:
    addi $v0, $0, 5 # read int
    syscall

    addi $t0, $v0, 0 # first term in t0

    addi $v0, $0, 12 # read char
    syscall
    addi $t1, $v0, 0 #operand in t1

    addi $v0, $0, 5 # read int
    syscall

    addi $t2, $v0, 0 # second term in t2

    beq $t1, $s0 Underscore
    beq $t1, $s1 Addition
    beq $t1, $s2 Subtraction
    beq $t1, $s3 Division
    beq $t1, $s4 Multiplication



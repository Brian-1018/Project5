.data
.text
.globl main
main:
    addi $s0, $0, 95 #_ ASCII
    addi $s1, $0, 43 #+ ASCII
    addi $s2, $0, 45 #- ASCII
    addi $s3, $0, 47 #/ ASCII
    addi $s4, $0, 42 #* ASCII
    addi $s5, $0, 10 #\n ASCII
    addi $s6, $0, 37 #% ASCII
    addi $s7, $0, 0 # our past result

Calc_loop:
    addi $v0, $0, 5 # read int (if first char is _ then this will do nothing)
    syscall

    addi $t0, $v0, 0 # first term in t0

    addi $v0, $0, 12 # read char
    syscall
    addi $t1, $v0, 0 #operand in t1

    beq $t1, $s0 Underscore1

    addi $v0, $0, 5 # read int
    syscall

    addi $t2, $v0, 0 # second term in t2

    addi $v0, $0, 12 # read char
    syscall

    beq $t1, $s0 Underscore2


    beq $t1, $s1 Addition
    beq $t1, $s2 Subtraction
    beq $t1, $s3 Division
    beq $t1, $s4 Multiplication
    beq $t1, $s6 Modulo

Underscore1:
    addi $t0, $s7, $0 #puts past result in t0

    addi $v0, $0, 12 # read char
    syscall
    addi $t1, $v0, 0 #operand in t1

    addi $v0, $0, 5 # read int
    syscall

    addi $t2, $v0, 0 # second term in t2

    addi $v0, $0, 12 # read char
    syscall

    beq $t1, $s0 Underscore2

    beq $t1, $s1 Addition
    beq $t1, $s2 Subtraction
    beq $t1, $s3 Division
    beq $t1, $s4 Multiplication
    beq $t1, $s6 Modulo

Underscore2:
    addi $v0, $0, 12 # read char
    syscall

    addi $t2, $s7, $0 # put past result in t2

    
    beq $t1, $s1 Addition
    beq $t1, $s2 Subtraction
    beq $t1, $s3 Division
    beq $t1, $s4 Multiplication
    beq $t1, $s6 Modulo


Addition:
    add $s7, $t1, $t2
    addi $v0, $0, 1   #print int
    syscall
    j Calc_loop
Subtraction
    sub $s7, $t1, $t2
    addi $v0, $0, 1   #print int
    syscall
    j Calc_loop
Division:
    div $t1, $t2
    mflo $s7
    j Calc_loop
Multiplication:
    mult $t1, $t2
    mflo $s7
    j Calc_loop
Modulo:
    div $t1, $t2
    mfhi $s7
    j Calc_loop
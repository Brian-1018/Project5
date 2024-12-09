.data
.text
.globl

addi $v0, $0, 23

addi $a0, $0, 1
addi $a1, $0, 10
addi $a2, $0, 2
addi $a3, $0, 10
addi $sp, $sp, -4
sw $a0, 0($sp)
syscall
addi $sp, $sp, 4

addi $v0, $zero, 10                 # syscall 10 to end the program
syscall
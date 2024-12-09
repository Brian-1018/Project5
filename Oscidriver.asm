.data
.text
.globl

addi $v0, $zero, 28
syscall

addi $v0, $zero, 24
syscall

addi $v0, $zero, 25
syscall

addi $v0, $zero, 26
syscall

addi $v0, $zero, 28
syscall

addi $v0, $zero, 27
syscall

addi $v0, $zero, 10                 # syscall 10 to end the program
syscall
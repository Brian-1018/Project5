.data
.text
.globl

addi $v0, $0, 21 #update code
addi $a0, $0, 200 #freq
addi $a1, $0, 75 #volume
syscall

addi $v0, $0, 22 #turn on
syscall

addi $v0, $0, 21 #update code
addi $a0, $0, 300 #freq
addi $a1, $0, 50 #volume
syscall

addi $v0, $0, 22 #turn off
syscall

addi $v0, $zero, 10                 # syscall 10 to end the program
syscall
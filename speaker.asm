.data
.text
.globl

# volume
addi $v0, $0, 19
addi $a0, $0, 2
addi $a1, $0, 2
addi $a2, $0, 100
syscall

# note1 freq
addi $v0, $0, 18
addi $a0, $0, 261
addi $a1, $0, 523
addi $a2, $0, 131
syscall

# playnote
addi $v0, $0, 20
syscall

# note2 freq
addi $v0, $0, 18
addi $a0, $0, 523
addi $a1, $0, 1047
addi $a2, $0, 261
syscall

# playnote
addi $v0, $0, 20
syscall

# note3 freq
addi $v0, $0, 18
addi $a0, $0, 494
addi $a1, $0, 988
addi $a2, $0, 247
syscall

# playnote
addi $v0, $0, 20
syscall

# note4 freq
addi $v0, $0, 18
addi $a0, $0, 392
addi $a1, $0, 784
addi $a2, $0, 196
syscall

# playnote
addi $v0, $0, 20
syscall

# note5 freq
addi $v0, $0, 18
addi $a0, $0, 440
addi $a1, $0, 880
addi $a2, $0, 220
syscall

# playnote
addi $v0, $0, 20
syscall

# note3 freq
addi $v0, $0, 18
addi $a0, $0, 494
addi $a1, $0, 988
addi $a2, $0, 247
syscall

# playnote
addi $v0, $0, 20
syscall

# note2 freq
addi $v0, $0, 18
addi $a0, $0, 523
addi $a1, $0, 1047
addi $a2, $0, 261
syscall

# playnote
addi $v0, $0, 20
syscall

# note1 freq
addi $v0, $0, 18
addi $a0, $0, 261
addi $a1, $0, 523
addi $a2, $0, 131
syscall

# playnote
addi $v0, $0, 20
syscall

# note5 freq
addi $v0, $0, 18
addi $a0, $0, 440
addi $a1, $0, 880
addi $a2, $0, 220
syscall

# playnote
addi $v0, $0, 20
syscall

# note4 freq
addi $v0, $0, 18
addi $a0, $0, 392
addi $a1, $0, 784
addi $a2, $0, 196
syscall

# playnote
addi $v0, $0, 20
syscall
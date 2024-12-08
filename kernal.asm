#This is starter code, so that you know the basic format of this file.
#Use _ in your system labels to decrease the chance that labels in the "main"
#program will conflict

.data
.text
_syscallStart_:
    beq $v0, $0, _syscall0 #jump to syscall 0
    addi $k1, $0, 1
    beq $v0, $k1, _syscall1 #jump to syscall 1
    addi $k1, $0, 5
    beq $v0, $k1, _syscall5 #jump to syscall 5
    addi $k1, $0, 9
    beq $v0, $k1, _syscall9 #jump to syscall 9
    addi $k1, $0, 10
    beq $v0, $k1, _syscall10 #jump to syscall 10
    addi $k1, $0, 11
    beq $v0, $k1, _syscall11 #jump to syscall 11
    addi $k1, $0, 12
    beq $v0, $k1, _syscall12 #jump to syscall 12
    # Add branches to any syscalls required for your stars.
    addi $k1, $0, 18
    beq $v0, $k1, _syscall18 #jump to syscall 18
    addi $k1, $0, 19
    beq $v0, $k1, _syscall19 #jump to syscall 19
    addi $k1, $0, 20
    beq $v0, $k1, _syscall20 #jump to syscall 20
    # Error state - this should never happen - treat it like an end program
    j _syscall10

# Do init stuff
_syscall0:
    # Initialization goes here
    addi $sp, $sp, -4096
    la $k1, _END_OF_STATIC_MEMORY_
    sw $k1, -4092($0)
    j _syscallEnd_

#Print Integer
_syscall1:
    # Print Integer code goes here
    addi $sp, $sp, -8 # allocate space on stack for 2 registers
    sw $t0, 0($sp) # save t0 on the stack
    sw $t1, 4($sp) # save t1 on the stack

    addi $t1, $0, 0 #t1 =0
    bne $a0, $0 notzero # if a0 is not zero
    addi $t0, $0, 48 # t0 = ascii 0
    sw $t0, -256($0) # print 0
    j endprintint

    notzero:
    slt $t0, $a0, $0 # t0 = 1 if a0<0 negative
    beq $t0, $0 mainprintintloop # if t0=0, not negative, go to main loop
    addi $t0, $0, 45 # ASCII for -
    sw $t0, -256($0) # print - to terminal
    addi $t0, $0, -1 #make t0 negative
    mult $a0, $t0 #make a0 positve
    mflo $a0

    mainprintintloop:
    addi $t0, $0, 10 #t0=10
    div $a0, $t0 # HI a0%10, Lo = a0//10
    mflo $a0 # puts rest in a0
    mfhi $t0 # remainder, rightmost in t0
    beq $a0, $0 actualprint
    addi $t1, $t1, 1 #t1++ counter of digits
    addi $sp, $sp, -4 # allocate space for 1 int
    sw $t0, 0($sp) # save it on stack
    j mainprintintloop

    actualprint:
    addi $t0, $t0, 48 # ASCII
    sw $t0, -256($0) #print to terminal
    beq $t1, $0, endprintint # when everything is gotten
    lw $t0, 0($sp) #get next digit from stack
    addi $sp, $sp, 4 # deallocate
    addi $t1, $t1, -1
    j actualprint

    endprintint:
    lw $t0, 0($sp) # get t0 back from mem
    lw $t1, 4($sp) # save t0 on the stack
    addi $sp, $sp, 8 #deallocate stack
    jr $k0

#Read Integer
_syscall5:
    # Read Integer code goes here
    addi $sp, $sp, -16 # allocate space on stack for 4 registers
    sw $t0, 0($sp) # save t0 on the stack
    sw $t1, 4($sp) # save t1 on the stack
    sw $t2, 8($sp) # save t2 on the stack
    sw $t3, 12($sp) # save t3 on the stack

    addi $t3, $0, 1 # t3 = 1
    firstint:
        lw $t0, -240($0) # checks if any input to keyboard
        beq $t0, $0, firstint # if no, loop

    lw $t0, -236($0) # puts first char in t0
    addi $v0, $0, 0 # v0 = 0
    addi $t1, $0, 45 # ASCII for -

    bne $t0, $t1, mainreadintloop # start if not negative
    sw $0, -240($0) # read next int
    addi $t3, $0, -1 # t3 = -1 if negative
    j firstint

    mainreadintloop:
    lw $t0, -236($0) # puts char in t0
    addi $t1, $0, 58 # above ASCII 9
    slt $t2, $t0, $t1 # t2=1 if t0<t1, input <58
    beq $t2, $0 endreadint

    addi $t1, $0, 48 # below ASCII 0
    slt $t2, $t0, $t1 # t2=1 if t0<t1, input < 48
    bne $t2, $0 endreadint

    addi $t2, $0, 10 #t2=10
    mult $v0, $t2 # shifts decimals to left
    mflo $v0
    addi $t0, $t0, -48 # converts ascii to int
    add $v0, $v0, $t0 #adds next digit to v0

    sw $0, -240($0) # read next int
    getint:
        lw $t0, -240($0) # checks if any input to keyboard
        beq $t0, $0, getint # if no, loop
    j mainreadintloop # start again

    endreadint:
    mult $v0, $t3 # mult result by t3, making it negative if needed
    mflo $v0 # gets it
    lw $t0, 0($sp) # get t0 back from mem
    lw $t1, 4($sp) # save t0 on the stack
    lw $t2, 8($sp) # save t0 on the stack
    lw $t3, 12($sp) # save t3 on the stack
    addi $sp, $sp, 16 #deallocate stack
    jr $k0

#Heap allocation
_syscall9:
    # Heap allocation code goes here
    lw $k1, -4092($0)
    add $k1, $k1, $a0 # allocates enough memory
    addi $v0, $k1, 0 #sets v0 to that address
    sw $k1, -4092($0)
    jr $k0

#"End" the program
_syscall10:
    j _syscall10


#print character
_syscall11:
    # print character code goes here
    sw $a0, -256($0) # writes ASCII to terminal
    jr $k0

#read character
_syscall12:
    # read character code goes here
    getchar:
        lw $v0, -240($0) # checks if any input to keyboard
        bne $v0, $0, gotchar # if yes, leave
        j getchar   # loop until input
    gotchar:
    lw $v0, -236($0) # gets the ASCII value
    sw $0, -240($0) # takes in character
    jr $k0

# extra challenge syscalls go here?
_syscall18:
    # speaker control frequency
    sw $a0, -80($0)
    sw $a1, -72($0)
    sw $a2, -64($0)
    jr $k0

_syscall19:
    # speaker control volume
    sw $a0, -76($0)
    sw $a1, -68($0)
    sw $a2, -60($0)
    jr $k0

_syscall20:
    # update speaker
    sw $0, -56($0)
    jr $k0

_syscallEnd_:
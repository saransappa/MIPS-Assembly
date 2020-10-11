.data
	msg1: .asciiz "\n Number of integers (N) ? "
	msg2: .asciiz "\n Sum - "
	lf: .asciiz "\n"
.text
	.globl main
main:
	li $v0, 4    # print msg1
	la $a0, msg1 
	syscall
	li $v0, 5 # take input N
	syscall
	move $t0, $v0 # save input N 
	li $t1, 0  # initialize counter(i)
	li $t2, 0  # initialize sum

loop: 	addi $t1, $t1, 1  # i= i+2
	add $t2, $t2, $t1 # sum = sum+i
	beq $t0, $t1, exit  # exit if i=N
	j loop

exit:	li $v0, 4  # print msg2
	la $a0, msg2
	syscall
	li $v0, 1  # print sum of N numbers
	move $a0, $t2
	syscall
	li $v0, 4  # print lf
	la $a0, lf
	syscall
	li $v0, 10 # exit program
	syscall

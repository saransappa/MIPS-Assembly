.data
	msg1: .asciiz "Enter N - "
	msg2: .asciiz "Product of first N natural numbers - "
	lf: .asciiz "\n"
.text
	.globl main
main:
	li $v0, 4 # print msg1
	la $a0, msg1
	syscall
	li $v0, 5 # take input N
	syscall
	move $t0, $v0 # save input N to $t0
	
	li $t1, 1 # initialize counter(i)
	li $t2, 1 # initialize product
	
loop:	addi $t1, $t1, 1  # i = i + 1
	mul $t2, $t2, $t1  # product = product * i
	beq $t1, $t0, exit # if i = N exit
	j loop # jump unconditionally to loop

exit:	li $v0, 4 # print msg2
	la $a0, msg2
	syscall
	li $v0,1 # print product of first N natural numbers
	move $a0, $t2
	syscall
	li $v0, 4  # print lf
	la $a0, lf
	syscall
	li $v0, 10 # exit program
	syscall
	
	
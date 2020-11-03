.data
	msg1: .asciiz "Enter N = "
	msg2: .asciiz "Sum of squares of first N even numbers = "
.text
	# print msg1
	li $v0, 4
	la $a0, msg1
	syscall
	
	# Take input and save N in $t0
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1,0 # initial even number
	li $t2,0 # initially Sum = 0
	li $t3,0 # variable to keep track of no.of even number squares added to sum
	while:
		beq $t3, $t0, exit
		mul $t4, $t1, $t1
		add $t2, $t2, $t4
		addi $t1, $t1, 2
		addi $t3, $t3, 1
		j while
	
	exit:
		# print sum of squares of first N even numbers
		li $v0, 4
		la $a0, msg2
		syscall
		li $v0, 1
		move $a0, $t2
		syscall
		# exiting the program
		li $v0, 10
		syscall
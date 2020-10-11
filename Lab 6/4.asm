.data
	msg0: .asciiz "---- Factorial ----\n"
	msg1: .asciiz "Enter an integer: "
	msg2: .asciiz "! = "
	msg3: .asciiz "Enter an integer greater than or equal to 1.\n"
	
.text

	# printing msg0
	li $v0, 4
	la $a0, msg0
	syscall
	
	# printing msg1
	li $v0, 4
	la $a0, msg1 
	syscall
	
	# take input and save n
	li $v0, 5
	syscall
	move $s0, $v0
	
	# check if n>=1
	bgt $s0, $zero, sol
	
	# print msg3
	li $v0, 4
	la $a0, msg3 
	syscall
	j exit
	
	sol:
		li $t0, 1
		li $t1, 1
		while:
			bgt $t1, $s0, close
			mul $t0, $t0, $t1
			addi $t1, $t1, 1
			j while
	close:
		li $v0, 1
		move $a0, $s0
		syscall
		
		# print msg2
		li $v0, 4
		la $a0, msg2
		syscall
		
		li $v0, 1
		move $a0, $t0
		syscall
		
	exit:
		li $v0, 10
		syscall
	

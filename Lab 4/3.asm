.data
	msg1: .asciiz "Enter a number: "
	msg2: .asciiz "Complement of given number: "
.text
	# printing msg1
	li $v0, 4
	la $a0, msg1
	syscall
	
	# taking input N
	li $v0, 5
	syscall
	
	# save input N to $t0
	move $t0, $v0
	
	# complementing N
	nor $t1, $t0, $zero
	
	# printing msg2
	li $v0, 4
	la $a0, msg2
	syscall
	
	# printing ~N
	li $v0, 1
	move $a0, $t1
	syscall
	
	# exiting the program
	li $v0, 10
	syscall


	
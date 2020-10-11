.data
	msg0: .asciiz "Enter a number: "
	msg1: .asciiz "No.of 1's in the input number = "
.text
	# print msg0
	li $v0 , 4
	la $a0, msg0
	syscall
	
	# take input and save n
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $t1, 31
	li $t2, 0
	while:
		ble $t1, $zero, exit
		andi $t3, $t0, 1
		beq  $t3, $zero, jump
		addi $t2, $t2, 1
		jump: 
			addi $t1, $t1, -1
			srl $t0, $t0, 1
			j while
	exit:
		li $v0, 4
		la $a0, msg1
		syscall
		
		li $v0, 1
		move $a0, $t2
		syscall
		
		li $v0, 10
		syscall
.data
	len: .asciiz "length of array = "
	array: .word 50 
.text
	la $t0, array
	move $t3, $t0
	# Filling the array of some length with 1s
	li $t1,33 # $t1 defines length of array
	li $t2,0
	li $t9, 1
	while:
		beq $t1, $t2, escape
		sw $t9, 0($t3)
		addi $t3, $t3, 4
		addi $t2, $t2, 1 
		j while
	escape:
		# Filling array with 2 0s to mark the end of array
		sw $zero, 0($t3)
		addi $t3, $t3, 4
		sw $zero, 0($t3)
	# Finding length of array
	findLength:
		move $t3, $t0
		li $t8, 0 # stores length in $t8
	
		loop:
			lw $t5, 0($t3)
			lw $t6, 4($t3)
			beq $t5, $zero, check
			j next
			check:
				beq $t6, $zero, exit 	
			next:
				addi $t8, $t8,1
				addi $t3, $t3, 4
			j loop
	
	exit:
		li $v0, 4
		la $a0, len
		syscall
		li $v0, 1
		move $a0, $t8
		syscall
		# exiting the program
		li $v0, 10
		syscall
		
.data
	msg: .asciiz "Enter n: "
	space: .asciiz " "
	newline: .asciiz "\n"
	array: .word 20
.text
	# Store the array base address of array
	la $s1, array
	move $t9, $s1 
	
	# Print msg
	li $v0, 4
	la $a0, msg
	syscall
	
	# Take input n
	li $v0, 5
	syscall
	
	# Save input n
	move $s0, $v0
	
	# take first two of fibonacci is $t0 and $t1
	li $t0, 0
	li $t1, 1
	
	beq $s0, 0, iszero
	beq $s0, 1, isone
	j else
	iszero:
		j exit	
	isone:
		sw $t0, 0($t9)
		j exit
	else:
		li $t3, 2
		# print and store fib(0)
		
		sw $t0, 0($t9)
		addi $t9, $t9, 4
		
		# print and store fib(1)
		sw $t1, 0($t9)
		addi $t9, $t9, 4
		
		while:
			beq $t3, $s0, exit
			add $t2, $t0, $t1
			
			sw $t2, 0($t9) # store in memory

			addi $t9, $t9, 4
			
			move $t0, $t1
			move $t1, $t2
			addi $t3, $t3, 1
			j while 
		
	exit:
		li $t8, 0
		la $t7, array
		loop:
			bge $t8, $s0, close	
			li $v0, 1
			lw $t6, 0($t7) # load from memory
			addi $t7, $t7, 4
			li $v0, 1
			move $a0, $t6
			syscall
			li $v0, 4
			la $a0, space
			syscall
			addi $t8, $t8,1
			j loop
	close:
		# Exit the program		
		li $v0, 10
		syscall
	
	

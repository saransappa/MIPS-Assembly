.data	
	space: .asciiz " "
.text
	# Loop counter variable declaration and initialization
	li $t0, 1
	li $t1, 10
	while:
		# Loop condition
		bgt $t0, $t1, exit
		
		# Body of loop
		li $v0, 1
		move $a0, $t0
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
		
		# Update loop counter variable
		addi $t0, $t0, 1 
		j while
	
	exit:
		li $v0, 10
		syscall
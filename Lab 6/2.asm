.data
	char: .space 1

.text
	# Take input of a character
	li $v0, 8
	la $a0, char
	li $a1, 3
	syscall
	
	# Load char to $t1
	la $t0, char
	lb $t1, 0($t0)
	# convert char to upper case by subtracting 32 from its value (ASCII)
	addi $t1, $t1, -32
	# Store value from $t1 in char
	sb $t1, 0($t0)
	
	# Print char
	li $v0 , 4
	la $a0, char
	syscall
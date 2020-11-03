.data
	msg1: .asciiz "x = "
	msg2: .asciiz "y = "
	newline: .asciiz "\n"

.text
	li $t3, 10 # x
	li $t4, 0 # y
	
	beq $t3, $zero, if
	li $t5,1
	beq $t3, $t5, elseif
	j else
	if:
		addi $t4, $t4, 1
		j exit
	elseif:
		addi $t4, $t4, -1
		j exit
	else:
		li $t4, 110
		j exit
	exit:
		# print x and y values
		li $v0, 4
		la $a0, msg1
		syscall
		li $v0, 1
		move $a0, $t3
		syscall
		li $v0, 4
		la $a0,newline
		syscall
		li $v0, 4
		la $a0, msg2
		syscall
		li $v0, 1
		move $a0, $t4
		syscall
		
		# exiting the program
		li $v0, 10
		syscall
		
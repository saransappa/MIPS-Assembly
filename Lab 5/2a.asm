.data
	newline: .asciiz "\n"
	msg1: .asciiz "$s0 = "
	msg2: .asciiz "$t1 = "
	msg3: .asciiz "$t2 = "
.text
	.globl main
main:
	# initializing required registers
	li $t0, -5
	li $t8, 9
	li $t1, 0
	li $t2, 0
	
	# if $t0<0 jump to if
	blt $t0, $zero, if
	j else 
	if:
		sub $s0, $zero, $t8
		addi $t1, $t1, 2
		
		# Print values for checking
		li $v0, 4
		la $a0, msg1
		syscall
		li $v0, 1
		move $a0, $s0
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		li $v0, 4
		la $a0, msg2
		syscall
		li $v0, 1
		move $a0, $t1
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		j exit
	else:
		move $s0, $t8
		addi $t2, $t2, 1
		
		# Print values for checking
		li $v0, 4
		la $a0, msg1
		syscall
		li $v0, 1
		move $a0, $s0
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		li $v0, 4
		la $a0, msg3
		syscall
		li $v0, 1
		move $a0, $t2
		syscall
		li $v0, 4
		la $a0, newline
		syscall
	exit:
		# exit the program
		li $v0, 10
		syscall
		

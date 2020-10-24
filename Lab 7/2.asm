.data
	msg0: .asciiz "Prime"
	msg1: .asciiz "Composite"
	msg2: .asciiz "Neither prime nor composite"
.text
	# Take input and save n
	li $v0, 5
	syscall
	move $t0, $v0
	
	# check if n=1
	li $t6, 1
	beq $t0, $t6, one
	
	# Prime check
	li $t1, 2
	li $t5, 0
	while:
		bge $t1, $t0, exit
		div $t3, $t0, $t1
		mul $t4, $t1, $t3
		beq $t4, $t0, composite
		addi $t1, $t1, 1
		j while
	composite:
		li $t5, 1
		li $v0, 4
		la $a0, msg1
		syscall
		j close
	exit:
		bne $t5,$zero, close
		li  $v0, 4
		la $a0, msg0
		syscall
		j close
	one:	
		li $v0, 4
		la $a0, msg2
		syscall
	close:
		li $v0, 10
		syscall
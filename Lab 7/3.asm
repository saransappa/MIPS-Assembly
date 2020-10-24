.data
	msg0: .asciiz "Count of prime numbers = "
.text
	li $s3, 0 # counting variable
	li $s0, 10 # starting number
	li $s1, 25 # ending number
	loop :
		bgt $s0, $s1, finish
		# take n = $s0
		move $t0, $s0
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
			j close
		exit:
			bne $t5,$zero, close
			addi $s3, $s3, 1 # Increment counter variable if $s0 is prime 
			j close
		one:	
		close:
			addi $s0, $s0, 1
		j loop
	finish:
		li $v0, 4
		la $a0, msg0
		syscall
		li $v0, 1
		move $a0, $s3
		syscall
		# Exit from the program
		li $v0, 10
		syscall
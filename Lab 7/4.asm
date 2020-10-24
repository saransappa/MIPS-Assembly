.data
	num: .asciiz "Enter a number: "
	buzz: .asciiz "Buzz Number."
	nobuzz: .asciiz "Not a Buzz number."
.text
	li $v0, 4
	la $a0, num
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Check if last digit is 7
	li $s0, 0 
	li $t9 ,10
	li $t2, 7
	div $t0, $t9
	mfhi $t1
	
	beq $t1, $t2, Buzz  
	
	# Check if input is divisible by 7  
	div $t3, $t0, $t2
	mul $t4, $t3, $t2
	beq $t4, $t0, Buzz
	j exit
	Buzz:
		li $v0, 4
		la $a0, buzz
		syscall	
		li $s0, 1
		j exit
		
	exit:
		bne $s0, $zero,close
		li $v0, 4
		la $a0, nobuzz
		syscall
	close: 
		li $v0, 10
		syscall
			
		
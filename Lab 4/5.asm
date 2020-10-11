.data
	msg1: .asciiz "Enter an integer (1-255) or Enter 0 to exit : "
	msg2: .asciiz "Binary representation: "
	ze: .asciiz "0"
	on: .asciiz "1"
	cflf: .asciiz "\n"
.text
	loop:
		# printing msg1
		li $v0, 4
		la $a0, msg1
		syscall
		# take input N
		li $v0, 5
		syscall
		# save N in $t0
		move $t0, $v0
		# exit if $t0=0
		beq $t0, $zero, exit
		# printing msg2
		li $v0, 4
		la $a0, msg2
		syscall
		# initializing $t1=8 (for checking 8 bits)
		li $t1, 8
		# initializing $t2 = 0x80
		li $t2, 0x80
		check:
			and $t3, $t2, $t0 # $t3 = $t0 AND $t2
			beq $t3, $zero, zero
			one:
				li $v0,4  # priting '1'
				la $a0,on
				syscall 
				j done
			zero:
				li $v0,4 # printing '0'
				la $a0,ze
				syscall 
			done:
				addi $t1, $t1, -1 
				sll $t0, $t0, 1 # $t0 <-- $t0 << 1 bit
				
			bne $t1, $zero, check
		li $v0,4  # printing cflf
		la $a0,cflf
		syscall 	
		j loop
		
	exit:
		# exiting the program
		li $v0, 10
		syscall
		

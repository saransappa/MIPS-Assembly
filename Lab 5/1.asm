.data
	msg1: .asciiz "Enter the number A: "
	msg2: .asciiz "Enter the number B: "	
	newline: .asciiz "\n"
	ans1: .asciiz "A is a multiple of B\n"
	ans2: .asciiz "B is a multiple of A\n"
	nans: .asciiz "Neither A is multiple of B nor B is multiple of A.\n"
.text
	.globl main
	
main:
	# printing msg1
	li $v0, 4
	la $a0, msg1
	syscall
	
	# taking input A
	li $v0, 5
	syscall
	
	# saving input A to $t0
	move $t0, $v0
	
	# printing msg2
	li $v0, 4
	la $a0, msg2
	syscall
	
	# taking input B
	li $v0, 5
	syscall
	
	# saving input B to $t1
	move $t1, $v0
	
	# check $t0 >= $t1 and go to 'label' if satisfied
	bge $t0, $t1, label
	div $t2, $t1, $t0 # $t2 = $t1/$t0
	mul $t3, $t2, $t0 # $t3 = $t2 * $t0
	# go to 'neq2' if not multiple
	bne $t3, $t1, neq2
	# print ans2
	li $v0, 4
	la $a0, ans2
	syscall
	# exit the program
	li $v0 , 10
	syscall
	neq2:
		# print nans
		li $v0, 4
		la $a0, nans
		syscall
		#exit the program
		li $v0 , 10
		syscall

	label:
		div $t2, $t0, $t1  # $t2 = $t0/$t1
		mul $t3, $t2, $t1  # $t3 = $t2 * $t1
		# go to 'neq1' if not multiple
		bne $t3, $t0, neql
		# print ans1
		li $v0, 4
		la $a0, ans1
		syscall
		#exit the program
		li $v0 , 10
		syscall

		neql:
			# print nans
			li $v0, 4
			la $a0, nans
			syscall
			#exit the program
			li $v0 , 10
			syscall

		

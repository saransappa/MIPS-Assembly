.data
	msg1: .asciiz "Enter an integer: "
	msg2: .asciiz "Enter the left shift needed (0-31): "
	msg3: .asciiz "Result after shifting = "
.text
	 # printing msg1
	li $v0, 4
	la $a0, msg1
	syscall
	# take input N (integer for shifting)
	li $v0, 5
	syscall
	# save N in $s0
	move $s0, $v0 
	# printing msg2
	li $v0, 4
	la $a0,msg2
	syscall
	# take input S for left shift
	li $v0, 5
	syscall
	# save S in $s1
	move $s1, $v0
	# Shift N by S bits and store result in $t0
	sllv $t0, $s0, $s1
	# printing msg3
	li $v0, 4
	la $a0,msg3 
	syscall
	# printing result which is in $t0
	li $v0, 1
	move $a0, $t0
	syscall
	
	# exit the program
	li $v0, 10
	syscall
	
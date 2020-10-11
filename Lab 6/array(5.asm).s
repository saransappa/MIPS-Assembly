.data
	msg0: .asciiz "a[0] = "
	msg1: .asciiz "a[4] = "
	newline: .asciiz "\n"
	# int[]a = new int[5]
	a: .word 5
.text
	la $t0, a
	# a[0] = 3
	li $t1, 3
	sw $t1, 0($t0)
	# a[4] = a[0] - 1
	lw $t1, 0($t0)
	addi $t1, $t1, -1
	sw $t1, 16($t0)
	
	### check ###
	
	# print msg0
	li $v0, 4
	la $a0, msg0
	syscall
	lw $t2, 0($t0)
	li $v0, 1
	move $a0, $t2
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	li $v0, 4
	la $a0, msg1
	syscall
	lw $t2, 16($t0) 
	li $v0, 1
	move $a0, $t2
	syscall
	
	#exit
	li $v0, 10
	syscall

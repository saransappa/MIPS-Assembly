.data
	cflf: .asciiz "\n"
.text
main:
	# given values
	li $t2, 0xabcd1234
	li $t3, 16
	
	# a
	sll $t1, $t2, 8
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, cflf
	syscall
	
	# b
	srl $t1, $t2, 4
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, cflf
	syscall
	
	# c
	sra $t1, $t2, 4
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, cflf
	syscall
	
	# d
	srlv $t1, $t2, $t3
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, cflf
	syscall
	
	# exit the program
	li $v0, 10
	syscall




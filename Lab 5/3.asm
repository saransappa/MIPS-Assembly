.data
	msg: .asciiz "Result stored in Z[K] =  "
	newline: .asciiz "\n"
	array: .space 80 # 20 sized array, 20x4 = 80 bytes
	
.text
	.globl main
	
main:
	# Store array base address in $t0
	la $t0, array
	# Store Y=60 in $t1
	li $t1, 60
	# Store K=20 in $t2
	li $t2, 20
	# Calculating Y - 16 * (K/4 + 210)
	move $t3, $t2 # Copying K value from $t2 to $t3
	srl $t3, $t3, 2 # Calculating K/4 by $t3 = $t3>>2bits
	addi $t3, $t3, 210 # Calculating (K/4 + 210) by $t3 = $t3 + 210
	sll $t3, $t3, 4 # Calculating 16*(K/4 +210) by $t3 = $t3<<4bits
	sub $t3, $t1, $t3 # Calculating Y-16*(K/4 +210) by $t3 = $t1 - $t3 since Y is in $t1
	
	# Executing Z[K]=Y-16*(K/4 + 210)
	sw $t3, 80($t0) # offset is 80 since K = 20
	
	# Printing value present in Z[K] after printing msg
	li $v0, 4
	la $a0, msg
	syscall
	lw $t5, 80($t0)
	li $v0, 1
	move $a0, $t5
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	# exiting the program
	li $v0, 10
	syscall
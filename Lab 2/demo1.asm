.data
	msg1: .asciiz "\nEnter A: "
	msg2: .asciiz "\nEnter B: "
	msg3: .asciiz "\nA + B = "
	cflf: .asciiz "\n"
	
.text
	.globl main
main:
	li $v0, 4  # print msg1
	la $a0, msg1
	syscall
	li $v0, 5  # Take input A 
	syscall
	move $t0, $v0 # save input A
	li $v0, 4  # print msg2
	la $a0, msg2
	syscall
	li $v0, 5  # Take input B 
	syscall
	move $t1, $v0 # save input B
	add $t0, $t0, $t1  # A = A+B
	li $v0, 4    # print msg3
	la $a0, msg3  
	syscall
	li $v0, 1   # print sum
	move $a0, $t0
	syscall
	li $v0, 4 # print cflf
	la $a0, cflf 
	syscall
	li $v0, 10 # exit
	syscall
	
	
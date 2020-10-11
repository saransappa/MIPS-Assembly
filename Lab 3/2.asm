.data
	msg1: .asciiz "Enter 1st value: "
	msg2: .asciiz "Enter 2nd value: "
	msg3: .asciiz "value 1 = "
	msg4: .asciiz "value 2 = "
	cflf: .asciiz "\n"
.text
	.globl main

main:
	li $v0, 4 # print msg1
	la $a0, msg1
	syscall 
	li $v0, 5 # take 1st value as input
	syscall
	move $t0, $v0 # save 1st value in $t0
	li $v0, 4 # print msg2
	la $a0, msg2
	syscall 
	li $v0, 5 # take 2nd value as input
	syscall
	move $t1, $v0 # save 2nd value in $t1
	add $t0, $t0, $t1
	sub $t1, $t0, $t1
	sub $t0, $t0, $t1
	li $v0, 4 # print cflf
	la $a0, cflf
	syscall
	li $v0, 4 # print msg3
	la $a0, msg3
	syscall
	li $v0, 1 # print value 1
	move $a0, $t0 
	syscall
	li $v0, 4 # print cflf
	la $a0, cflf
	syscall
	li $v0, 4 # print msg4
	la $a0, msg4
	syscall
	li $v0, 1 # print value 2
	move $a0, $t1 
	syscall
	li $v0, 10 # exit program
	syscall
	
		
	

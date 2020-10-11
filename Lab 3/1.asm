.data
	msg1: .asciiz "--- Program to print area of a rectangle ---\n"
	msg2: .asciiz "Enter the width of the rectangle: "
	msg3: .asciiz "Enter the height of the rectangle: "
	msg4: .asciiz "Area of the rectangle = "
	cflf: .asciiz "\n"
.text
	.globl main

main:
	li $v0, 4 # print msg1
	la $a0, msg1 
	syscall
	li $v0, 4 # print cflf
	la $a0, cflf
	syscall
	li $v0, 4 # print msg2
	la $a0, msg2 
	syscall
	li $v0, 5 # take width from input
	syscall
	move $t0, $v0	# save width
	li $v0, 4 # print msg3
	la $a0, msg3
	syscall
	li $v0, 5 # take height from input
	syscall
	move $t1, $v0	# save height
	mul $t2, $t0, $t1  # area = width * height
	li $v0, 4 # print msg4
	la $a0, msg4
	syscall
	li $v0, 1 # print area
	move $a0, $t2
	syscall
	li $v0, 4 # print cflf
	la $a0, cflf
	syscall
	li $v0, 10 #exit the program
	syscall
	
	

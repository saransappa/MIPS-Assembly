.data
	msg1: .asciiz "Enter A: "
	msg2: .asciiz "Enter B: "
	msg3: .asciiz "Product of A and B = "
	nl: .asciiz "\n"
.text
	.globl main
main:
	li $v0, 4 # print msg1
	la $a0, msg1
	syscall
	li $v0, 5 # take input A 
	syscall
	move $t0, $v0 # save input A
	li $v0, 4 # print msg2
	la $a0, msg2 
	syscall
	li $v0, 5 # take input B
	syscall
	move $t1, $v0 # save input B
	mul $t0, $t0, $t1 # $t0 = $t0 * $t1
	li $v0,4  # print msg3
	la $a0,msg3
	syscall
	li $v0, 1  # print A * B
	move $a0, $t0
	syscall
	li $v0, 4 # print newline
	la $a0, nl
	syscall
	li $v0, 10 # exit
	syscall
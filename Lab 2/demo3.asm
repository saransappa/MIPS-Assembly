.data
	MSG1: .asciiz "The numbers 5 and 6 are multiplied together: "
	lf: .asciiz "\n"
.text
	.globl main
	
main:
	li $t1, 5 # load 5 into $t1
	li $t2, 6 # load 6 into $t2
	mul $t1, $t1, $t2 # $t1 = $t1 * $t2
	li $v0, 4  # print MSG1
	la $a0, MSG1 
	syscall
	li $v0, 1 # print 5*6 
	move $a0, $t1
	syscall
	li $v0, 4  # print lf
	la $a0, lf
	syscall
	li $v0, 10 #exit
	syscall 
	
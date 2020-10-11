.data
	msg: .asciiz "Enter a number : "
	odd: .asciiz " is odd.\n"
	even: .asciiz " is even.\n"

.text
	.globl main
main:
	li $t0, 1 # load $t0 with 1
	li $v0, 4 # print msg
	la $a0, msg
	syscall
	li $v0, 5 # take input of number to be checked
	syscall
	move $t1, $v0 # save input in $t1
	and $t2, $t0, $t1 # AND input and 1
	beq $t2, $t0, oddnum  # jump to oddnum if $t0 == $t2

evennum:		
	li $v0, 1  # print input value
	move $a0, $t1
	syscall
	li $v0, 4  # print even
 	la $a0, even
	syscall
	j exit  # jump to exit
oddnum:
	li $v0, 1  # print input value
	move $a0, $t1
	syscall
	li $v0, 4  # print odd
 	la $a0, odd
	syscall
	 
exit:
	li $v0, 10  # exit the program
	syscall	
	
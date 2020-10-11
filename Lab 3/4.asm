.data
	msg0: .asciiz "----- For calculating 4x^2 + 2x + 3 -----\n"
	msg1: .asciiz "Enter value of x: "
	msg2: .asciiz "4x^2 + 2x + 3 = "
	msg3: .asciiz "----- For calculating 5x + 3y + z -----\n"
	msg4: .asciiz "Enter value of y: "
	msg5: .asciiz "Enter value of z: "
	msg6: .asciiz "5x + 3y + z = "
	msg7: .asciiz "----- For calculating ((5x + 3y + z)/2)*3 -----\n"
	msg8: .asciiz "((5x + 3y + z)/2)*3 = "
	msg9: .asciiz "----- For calculating (4x/3)*y -----\n"
	msg10: .asciiz "(4x/3)*y = "
	five: .float 5.0
	three: .float 3.0
	two: .float 2.0
	cflf: .asciiz "\n\n"
.text
	.globl  main

main:
	#--------------- (i) 4x^2 + 2x + 3 ---------------------
	li $v0, 4 # printing msg0
	la $a0, msg0
	syscall
	li $v0, 4 # printing msg1
	la $a0, msg1 
	syscall
	li $v0, 5 # take input x
	syscall
	move $t0, $v0 # save x in $t0
	mul $t1, $t0 , $t0 # calculating x^2
	li $t8, 4 # load $t8 with 4
	li $t9, 2 # load $t9 with 2
	mul $t1, $t1, $t8  # calculating 4x^2
	mul $t2, $t0, $t9 # calclating 2x
	add $t3, $t1, $t2 # calculting 4x^2 + 2x
	li $t7, 3 #load $t7 with 3
	add $t3, $t3, $t7 # calculting 4x^2 + 2x + 3
	li $v0, 4 # print msg2 
	la $a0, msg2
	syscall
	li $v0, 1 # printing 4x^2 + 2x + 3
	move $a0, $t3
	syscall
	li $v0, 4 # print cflf 
	la $a0, cflf
	syscall
	
	
	#--------------- (ii) 5x + 3y + z ---------------------
	li $v0, 4 # printing msg3
	la $a0, msg3
	syscall
	li $v0, 4 # printing msg1
	la $a0, msg1 
	syscall
	li $v0, 5 # take input x
	syscall
	move $t0, $v0 # save x in $t0
	li $v0, 4 # printing msg4
	la $a0, msg4
	syscall
	li $v0, 5 # take input y
	syscall
	move $t1, $v0 # save y in $t1
	li $v0, 4 # printing msg5
	la $a0, msg5
	syscall
	li $v0, 5 # take input z
	syscall
	move $t2, $v0 # save z in $t2
	li $s0, 5  # load $s0 with 5
	li $s1, 3  # load $s1 with 3
	mul $t0, $t0, $s0 # calculating 5x
	mul $t1, $t1, $s1 # calculating 3y
	add $t0, $t0, $t1 # calculating 5x + 3y
	add $t0, $t0, $t2 # calculating 5x + 3y + z
	li $v0, 4 # print msg6
	la $a0, msg6
	syscall
	li $v0, 1 # printing 5x + 3y + z
	move $a0, $t0
	syscall
	li $v0, 4 # print cflf 
	la $a0, cflf
	syscall
	
	#--------------- (iii) ((5x + 3y + z)/2)*3 ---------------------
	li $v0, 4 # printing msg7
	la $a0, msg7
	syscall
	li $v0, 4 # printing msg1
	la $a0, msg1 
	syscall
	li $v0, 5 # take input x
	syscall
	move $t0, $v0 # save x in $t0
	li $v0, 4 # printing msg4
	la $a0, msg4
	syscall
	li $v0, 5 # take input y
	syscall
	move $t1, $v0 # save y in $t1
	li $v0, 4 # printing msg5
	la $a0, msg5
	syscall
	li $v0, 5 # take input z
	syscall
	move $t2, $v0 # save z in $t2
	li $s0, 5  # load $s0 with 5
	li $s1, 3  # load $s1 with 3
	mul $t0, $t0, $s0 # calculating 5x
	mul $t1, $t1, $s1 # calculating 3y
	add $t0, $t0, $t1 # calculating 5x + 3y
	add $t0, $t0, $t2 # calculating 5x + 3y + z
	
	mtc1 $t0, $f12  # converting 5x + 3y + z to float
 	cvt.s.w $f12, $f12
 	
 	lwc1 $f2, two # load 2.0 in $f2
 	div.s $f12, $f12, $f2 # calculating (5x + 3y + z)/2
 	
 	lwc1 $f2, three # load 3.0 in $f2
 	mul.s $f12, $f12, $f2  # calculating ((5x + 3y + z)/2)*3
 	
 	li $v0, 4 # printing msg8
 	la $a0, msg8
 	syscall
 	li $v0, 2 #printing  ((5x + 3y + z)/2)*3
 	syscall 
 	
	li $v0, 4 # print cflf 
	la $a0, cflf
	syscall
	
	#--------------- (iv) (4x/3)*y ---------------------
	
	li $v0, 4 # printing msg9
	la $a0, msg9
	syscall
	li $v0, 4 # printing msg1
	la $a0, msg1 
	syscall
	li $v0, 5 # take input x
	syscall
	move $t0, $v0 # save x in $t0
	li $v0, 4 # printing msg4
	la $a0, msg4
	syscall
	li $v0, 5 # take input y
	syscall
	move $t1, $v0 # save y in $t1
	li $t2, 4  # load $t2 with 4
	mul $t0, $t0, $t2 # calculating 4x
	mtc1 $t0, $f12  #  converting 4x into float
	cvt.s.w $f12, $f12
	mtc1 $t1, $f10  #  converting y into float
	cvt.s.w $f10, $f10
	lwc1 $f2, three # load $f2 with 3.0
	div.s $f12, $f12, $f2 # calculating (4x/3)
	mul.s $f12, $f12, $f10 # calculating (4x/3)*y
	li $v0, 4 # printing msg10
 	la $a0, msg10
 	syscall
 	li $v0, 2 #printing  (4x/3)*y
 	syscall 
	li $v0, 4 # print cflf 
	la $a0, cflf
	syscall
	li $v0, 10 # exit the program
	syscall
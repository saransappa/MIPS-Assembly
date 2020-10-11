.data
.text
main:
	# initializing values in  $s1-$s4
	li $s1, 1  # x
	li $s2, 2  # y
	li $s3, 3  # z
	li $s4, 4  # q
	
	add $s1, $s1, $s2 # x = x+y
	add $s1, $s1, $s3 # x = x+y+z
	sub $s1, $s1, $s4 # x = x+y+z-q
	
	# printing value in  $s1
	li $v0, 1
	move $a0, $s1
	syscall
	
	
	
	

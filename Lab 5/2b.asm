.data

.text
	.globl main

main:
	li $a0, 0
	li $t0, 8
	for:
		ble $t0, $zero, exit
		add $a0, $a0, $t0
		addi $t0, $t0, -1
		j for

	exit:
		# printing value in register $a0
		li $v0, 1
		syscall
		
		li $v0, 10
		syscall
		
		
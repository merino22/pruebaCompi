.data
    str1: .asciiz "input palabra: "
    inputStr: .asciiz ""
    result: .asciiz "Cantidad de vocales: "
.text
.globl main


loop:

    lb $t1, 0($t2)
    li $v0, 11
    add $a0, $t1, $zero
    beq $t1, $zero, exit_loop
    syscall
    li $t6, 'a'
    beq $t1, $t6, inc
    li $t6, 'e'
    beq $t1, $t6, inc
    li $t6, 'i'
    beq $t1, $t6, inc
    li $t6, 'o'
    beq $t1, $t6, inc
    li $t6, 'u'
    beq $t1, $t6, inc
    j end_ifs

inc:
    addi $t7, $t7, 1

end_ifs:
    addi $t2, $t2, 1
    addi $t0, $t0, 1
    j loop

exit_loop:
    li $v0, 1
    add $a0, $t7, $zero
    syscall  

    li $v0, 10
    syscall

main:
    li $v0, 4
    la $a0, str1
    syscall

    li $v0, 8
    la $a0, inputStr
    move $s1, $a0
    syscall

    move $s3, $a1
    
    li $t2, 0
    addi $t2, $s1, 0
    li $t7, 0
    li $t0, 0
    move $t4, $s3
    j loop
.data
    str1: .asciiz "input palabra: "
    str2: .asciiz "Cantidad de vocales: "
    inputStr: .asciiz ""
.text
.globl main

countVocals:

li $t2, 0
addi $t2, $s1, 0
li $t7, 0
li $t0, 0
li $t1, 0
loop:
    lb $t1, 0($t2)
    beq $t1, $zero, exit_loop
if_a:
    li $t6, 'a'
    beq $t1, $t6, inc
if_e:
    li $t6, 'e'
    beq $t1, $t6, inc
if_i:
    li $t6, 'i'
    beq $t1, $t6, inc
if_o:
    li $t6, 'o'
    beq $t1, $t6, inc
if_u:
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

move $s2, $t7
jr $ra

main:
    li $v0, 4
    la $a0, str1
    syscall

    li $v0, 8
    la $a0, inputStr
    move $s1, $a0
    syscall

    move $s3, $a1
    
    jal countVocals  

    li $v0, 4
    la $a0, str2
    syscall

    li $v0, 1
    move $a0, $s2
    syscall

    li $v0, 10
    syscall
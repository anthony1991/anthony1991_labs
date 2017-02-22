# Calculate the population count of an array
# for MYΥ-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou

        .globl main # declare the label main as global. 
        
        .text 

main:
        # These are for providing input and testing, don't change in your
        #  final submission
        li    $v0, -1   # non-zero v0 to catch code dependent on zeroed regs

        li    $a0, 0xa5ca3695
        jal   popc
        addu  $s0, $v0, $zero   # Move the result to s0 for tester to check

        li    $a0, 0x0
        jal   popc
        addu  $s1, $v0, $zero   # Move the result to s1 for tester to check

        # Try it with an array
        la    $a0, array
        li    $a1, 4
        jal   sum_popc
        addu  $s2, $v0, $zero   # Move the result to s2 for tester to check

        # Try it with 1 item 
        la    $a0, array
        addi  $a0, $a0, 12
        li    $a1, 1
        jal   sum_popc
        addu  $s3, $v0, $zero   # Move the result to s3 for tester to check

        # ----- Try with 0
        la    $a0, array
        li    $a1, 0
        jal   sum_popc
        addu  $s4, $v0, $zero   # Move the result to s4 for tester to check


        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.

 
        ########################################################################
        #  Write your code here. Leave main as is.
        ########################################################################

popc:
        jr     $ra


sum_popc:
        jr    $ra

        

        ###############################################################################
        # Data input.
        ###############################################################################
       .data
array: .word 0xa5ca3691, 0x5a3695ca, 0x36a9ca55, 0xc55a36a9

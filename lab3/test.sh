#!/bin/bash
echo "Starting to generate assembler casting:"
for var in 0 1 2 3 s fast g
do
    echo "For 64-Bit"
    echo '-O'$var' mode'
    gcc -S -O$var ./lab3.c -o ./assembler/lab3_64_O$var.s
    echo "---> DONE"
    echo "For 32-Bit:"
    echo '-O'$var' mode'
    gcc -S -O$var ./lab3.c -m32 -o ./assembler/lab3_32_O$var.s
    echo "---> DONE"
done
#!/bin/bash
echo 'Start time dimension' >> ./results.txt
for var in 0 1 2 3 s fast g
do  
    gcc -O$var ../lab2.c -o ../build/lab2 -Wall
    echo '-O'$var' mode' >> ./results.txt
    echo '---------------' >> ./results.txt
    echo '[' >> results.txt
    for ((i=0; i < 10; ++i))
    do  
        if [ $i -eq 9 ]
        then
            sudo time -a -o ./results.txt -f"%e" ../build/lab2
        else
            sudo time -a -o ./results.txt -f"%e, " ../build/lab2
        fi
    done

    echo '] File size: '$(stat -c %s ../build/lab2 ) >> results.txt
    echo '---------------' >> ./results.txt
done
echo 'End time dimension' >> ./results.txt

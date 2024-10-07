#!/bin/bash


MAX=5
for i in $(seq 1 5)
do

    NUM=$i
    BLANK_NUM=$(expr $MAX - $NUM)

    for j in $(seq $BLANK_NUM -1 1)
    do
        echo -n " " 
    done

    for k in $(seq 1 $NUM)
    do
        echo -n "*"
    done
    echo
done

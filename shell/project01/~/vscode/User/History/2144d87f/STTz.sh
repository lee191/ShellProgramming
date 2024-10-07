#!/bin/bash

START=200
END=230
NET=172.16.6

for i in $(seq $START $END)
do 
    ping -c 1 -W 0.5 $NET.$i > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "[  OK  ] The $NET.$i is alive"
    else
        echo "[ FAIL ] The $NET.$i is dead"
    fi
done

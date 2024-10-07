#!/bin/bash


echo -n "Enter A : "
read NUM1

echo -n "Enter Operator : "
read OPERATOR
echo $OPERATOR
echo -n "Enter C : "
read NUM2

case $OPERATOR in
    '+') echo "$NUM1 + $NUM2 = $(expr $NUM1 + $NUM2)" ;;
    '-') echo "$NUM1 - $NUM2 = $(expr $NUM1 - $NUM2)" ;;
    '*') echo "$NUM1 x $NUM2 = $(expr $NUM1 \* $NUM2)";;
    '/') echo "$NUM1 / $NUM2 = $(expr $NUM1 / $NUM2) ";;
    *) echo "Error"                                   ;;
esac

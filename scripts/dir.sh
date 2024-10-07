#!/bin/bash

echo -n "Enter Your Filename : "
read File1

# echo $File1
if [ -d $File1 ]; then
    echo "[ OK ] $File1: 디렉토리 입니다."
elif [ -f $File1 ]; then
    echo "[ OK ] $File1: 일반파일 입니다."
else
    echo "[ FIAL ] $File1: 일반파일 또는 디렉토리가 아닙니다."
    exit 2
fi
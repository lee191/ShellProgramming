#!/bin/bash

# Function definitions
YES() {
    echo
    echo "YES" | boxes -d info
}

NO() {
    echo
    echo "NO" | boxes -d info
}

FAIL() {
    echo "[ FAIL ] 잘못된 만남 2" | boxes -d critical
    exit 2
}

# Variable definitions


echo -n "선택하십시오.(yes/no): "
read CHOICE

case $CHOICE in
    y|Y|yes|YES|Yes) YES    ;;
    n|N|no|NO|No)    NO     ;;
    *)               FAIL   ;;
esac

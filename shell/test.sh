#!/bin/bash
set -e

# cat /test/file1 | tr '\n' ' '


DNS=
for i in $(cat /test/file1)
do
    DNS="$DNS $i"

done
echo $DNS
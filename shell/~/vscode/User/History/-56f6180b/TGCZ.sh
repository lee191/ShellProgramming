#!/bin/bash

SERVERLIST=$(cat /root/shell/server.txt)

echo $SERVERLIST

for i in $SERVERLIST
do
    ftp -n $i 21 << EOF
    user root centos
    cd /tmp
    lcd /test
    bin
    hash
    prompt
    mput linux228.txt
    quit
EOF
done

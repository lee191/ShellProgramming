#!/bin/bash

SERVERLIST=/root/shell/server.txt


for i in $SERVERLIST
do
    ftp -n 127.0.0.1 21 << EOF
    user root centos
    cd /tmp
    lcd /test
    bin
    hash
    prompt
    mput testfile.txt
    quit
EOF
done

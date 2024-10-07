#!/bin/bash

FRPUSERS=/etc/vsftpd/ftpusers

for NAME in $(cat ftpusers | egrep -v '^#|^$')
do 
    echo "[   OK   ]$NAME cna't access to FTP SERVER"
done

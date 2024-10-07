#!/bin/bash

# Functions definition
Help() {
cat << EOF
Commands may be abbreviated.  Commands are:

!		debug		mdir		sendport	site
$		dir		mget		put		size
account		disconnect	mkdir		pwd		status
append		exit		mls		quit		struct
ascii		form		mode		quote		system
bell		get		modtime		recv		sunique
binary		glob		mput		reget		tenex
bye		hash		newer		rstatus		tick
case		help		nmap		rhelp		trace
cd		idle		nlist		rename		type
cdup		image		ntrans		reset		user
chmod		lcd		open		restart		umask
close		ls		prompt		rmdir		verbose
cr		macdef		passive		runique		?
delete		mdelete		proxy		send

EOF
}

Invalid() {
    echo "?Invalid command"
}

Open() {
    echo -n "접속 하려고 하는 FTP 서버 IP: "
    read IP1
    # echo $IP1
    ftp $IP1
}



while true
do
    echo -n "Myftp> "
    read CMD
    # echo $CMD
    case $CMD in
        'help') Help    ;;
        'open') Open    ;;
        'quit') break   ;;
        '')     :       ;;
        *)      Invalid ;;
    esac
done


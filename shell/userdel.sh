#!/bin/bash

USERLIST=/root/shell/user.list

cat $USERLIST | while read UNAME UPASS
do
    # echo "$UNAME $UPASS"
    userdel -r $UNAME
    [ $? -eq 0 ] \
        && echo "[  OK  ] $UNAME 사용자 삭제 완료." \
        || ehco "[ FAIL ] $UNAME 사용자 삭제 에러"
done
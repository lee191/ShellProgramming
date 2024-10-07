#!/bin/bash

export LANG=en_US.UTF-8

REMOTE=172.16.6.250
TMP1=/tmp/tmp1
TMP2=/tmp/tmp2
TMP3=/tmp/tmp3

systemctl -t service \
     | awk '{print $1, $3}' \
     | sed -n '2,/^LOAD/p' \
     | sed '$d' > $TMP1

ssh "$REMOTE" systemctl -t service \
     | awk '{print $1, $3}' \
     | sed -n '2,/^LOAD/p' \
     | sed '$d' > $TMP2

diff $TMP1 $TMP2 > $TMP3


echo " ---- 172.16.6.228 ---- "
cat $TMP3 | fgrep '<' | cut -c3-
echo

echo " ---- $REMOTE ---- "
cat $TMP3 | fgrep '>' | cut -c3-
echo
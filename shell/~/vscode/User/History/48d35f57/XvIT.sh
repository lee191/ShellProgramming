#!/bin/bash

export LANG=en_US.UTF-8
TMP1=/tmp/tmp1
TMP2=/tmp/tmp2

systemctl -t service \
     | awk '{print $1, $3}' \
     | sed -n '2,/^LOAD/p' \
     | sed '$d' > $TMP1

systemctl -t service \
     | awk '{print $1, $3}' \
     | sed -n '2,/^LOAD/p' \
     | sed '$d' > $TMP1

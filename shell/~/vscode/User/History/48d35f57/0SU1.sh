#!/bin/bash

TMP1=/tmp/tmp1


systemctl -t service \
     | awk '{print $1, $3}' \
     | sed -n '2,/^LOAD/p' \
     | sed '$d'

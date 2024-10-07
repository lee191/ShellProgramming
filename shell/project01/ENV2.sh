#!/bin/bash

############################
# 1. $HOME/.bashrc
# 2. $HOME/.vimrc
# 3.  ?
############################

set -e

source /root/shell/functions.sh


###########################################################
# 1. $HOME/.bashrc
###########################################################

echo "[$HOME/.bashrc 서비스]"

BASHRC=$HOME/bashrc.txt
# BASHRC=$HOME/.bashrc

echo "==========================================="
echo "[ Phase 01] $BASHRC 파일 설정"
/bin/cp /etc/skel/.bashrc $BASHRC
cat << EOF >> $BASHRC
#
#   Specific configuration
#

export PS1='\[\e[31;1m\][\u@\h\[\e[33;1m\] \w]\$ \[\e[m\]'
alias ls='ls -h --color=auto'
alias pps='ps -ef | head -1; ps -ef | grep $1'
alias vi='/usr/bin/vim'
alias grep='grep -i --color=auto'
alias ret='mkdir -p /test && cd /test && rm -rf /test/*'
alias c="clear"
alias df='df -h -T'
EOF
echo "[  OK  ] $BASHRC 설정 완료"
echo "==========================================="
echo
###########################################################
# 2. $HOME/.vimrc
###########################################################

echo "[$HOME/.vimrc 서비스]"

VIMRC=$HOME/.vimrc

echo "==========================================="
echo "[ Phase 01] $VIMRC 파일 설정"
cat << EOF > $VIMRC
syntax on
set ts=4
set nu
set ai
set sw=4
set et
EOF
echo "[  OK  ] $VIMRC 설정 완료"
echo "==========================================="
echo
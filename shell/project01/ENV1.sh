#!/bin/bash

############################
# 1. telnet 서비스
# 2. vsftpd  서비스
# 3.  ?
############################

set -e

source /root/shell/functions.sh

###########################################################
# 1. telnet 서비스
# 1) 패키지 설치 - telnet-server, telnet
# 2) 서비스 기동 - telnet.socket
# 3) 방화벽 등록 - telnet
###########################################################
echo "[TELNET 서비스]"
# 1) 패키지 설치 - telnet-server, telnet
PKGS="telnet-server telnet"
echo "==========================================="
echo "[ Phase 01] $PKGS 패키지 설치"
PkgInstall $PKGS
echo "==========================================="

# 2) 서비스 기동 - telnet.socket
SVCS="telnet.socket"
echo "==========================================="
echo "[ Phase 02] $SVCS 서비스 기동"
ServiceStart $SVCS
echo "==========================================="

# 3) 방화벽 등록 - telnet
RULES="telnet"
echo "==========================================="
echo "[ Phase 03] $RULES 방화벽에 등록"
FWRule $RULES
echo "==========================================="

echo
###########################################################
# 2. vsftpd  서비스
# 1) 패키지 설치 - vsftpd, ftp
# 2) 서비스 설정 - /etc/vsftpd/{ftpusers,user_list}
# 3) 서비스 기동 - vsftpd.service
# 4) 방화벽 등록 - ftp
###########################################################

echo "[FTP 서비스]"
# 1) 패키지 설치 - vsftpd, ftp
PKGS="vsftpd ftp"
echo "==========================================="
echo "[ Phase 01] $PKGS 패키지 설치"
PkgInstall $PKGS
echo "==========================================="

# 2) 서비스 설정 - /etc/vsftpd/{ftpusers,user_list}
FTPUSERS=/etc/vsftpd/ftpusers
USER_LIST=/etc/vsftpd/user_list
for i in $FTPUSERS $USER_LIST
do
    sed -i 's/^root/#root/' $i
done
echo "==========================================="
echo "[ Phase 02] $FTPUSERS $USER_LIST 서비스 설정"
echo "[  OK  ] root 사용자 허용 설정 완료"
echo "==========================================="

# 3) 서비스 기동 - vsftpd.service
SVCS="vsftpd.service"
echo "==========================================="
echo "[ Phase 03] $SVCS 서비스 기동"
ServiceStart $SVCS
echo "==========================================="

# 4) 방화벽 등록 - ftp
RULES="ftp"
echo "==========================================="
echo "[ Phase 04] $RULES 방화벽에 등록"
FWRule $RULES
echo "==========================================="
echo
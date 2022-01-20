#!/bin/bash
cat << EOF > /etc/resolv.conf
nameserver 192.168.0.1
nameserver 8.8.8.8
nameserver 77.88.8.8
EOF

yum install -y \
redhat-lsb-core \
wget \
rpmdevtools \
rpm-build \
createrepo \
yum-utils

wget https://nginx.org/packages/centos/7/x86_64/RPMS/nginx-1.14.1-1.el7_4.ngx.x86_64.rpm
wget --no-check-certificate https://www.openssl.org/source/openssl-1.1.1m.tar.gz
tar -xvf openssl-1.1.1m.tar.gz
yum install gcc
yum localinstall -y \
nginx-1.14.1-1.el7_4.ngx.x86_64.rpm
systemctl start nginx
mkdir /usr/share/nginx/html/repo
createrepo /usr/share/nginx/html/repo/

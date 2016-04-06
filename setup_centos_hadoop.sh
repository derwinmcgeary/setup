#!/bin/bash
# Simple setup.sh for configuring CentOS6 and Hadoop

service iptables stop
chkconfig iptables off
service ip6tables stop
chkconfig ip6tables off
sysctl -w vm.swappiness=0
echo 0 > /proc/sys/vm/swappiness
ulimit -n 10000

yum -y install ntp
ntpdate 0.centos.pool.ntp.org
service ntpd start
chkconfig ntpd on
ntpstat
cd /opt

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jdk-8u77-linux-x64.rpm -O jdk-8u77-linux-x64.rpm

rpm -ivh jdk-8u77-linux-x64.rpm

alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_77/bin/java
200000

wget -nv http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.2.1.0/ambari.repo -O /etc/yum.repos.d/ambari.repo

yum -y install mysql-connector-java
yum -y install ambari-agent

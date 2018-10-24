#!/bin/sh

rpm -qa | grep mariadb > /dev/null 2>&1
if [ $? -ne 0 ]; then
	yum remove mariadb-libs mariadb mariadb-*
	if [ -d /var/lib/mysql ]; then
		rm -rf /var/lib/mysql
	fi
fi

rpm -qa | grep mysql57-community-release-el7-7 > /dev/null 2>&1
if [ $? -ne 0 ]; then
	if [ -d /var/lib/mysql ]; then
		rm -rf /var/lib/mysql
	fi
	yum -y localinstall http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm
	yum -y install yum-utils
	yum-config-manager --disable mysql57-community
	yum-config-manager --enable mysql56-community
	yum -y install mysql-community-server

	systemctl enable mysqld
	systemctl start mysqld
fi

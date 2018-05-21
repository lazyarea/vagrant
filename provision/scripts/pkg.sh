#!/bin/bash

yum remove -y php php-*
rm -fr/etc/php.* /etc/php


yum -y install vim net-tools bind-utils ngrep


curl -O -L http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
yum localinstall -y remi-release-7.rpm 


cat > /etc/yum.repos.d/nginx.repo << NGINX

[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/\$basearch/
gpgcheck=0
enabled=1
NGINX

yum -y --enablerepo=nginx install nginx
yum -y install mariadb mariadb-devel mariadb-server
yum -y install --enablerepo=remi-php56 libmcrypt libmcrypt-devel php php-mcrypt php-fpm composer \
	php-pecl-xdebug php-devel php-mbstring php-pdo php-gd \
        php-mcrypt php-zlib php-zip php-mysql  php-xml php-curl vim tree net-tools bind-utils ngrep nc

echo "date.timezone = Asia/Tokyo" >> /etc/php.ini

yum remove -y httpd 
systemctl enable nginx
systemctl enable mariadb
systemctl enable mariadb-server

firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --permanent --add-port=3306/tcp
firewall-cmd --reload

yum update -y
# reboot


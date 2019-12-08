#!/bin/bash

yum remove -y php php-*
rm -fr /etc/php.* /etc/php


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
yum -y install --enablerepo=remi,remi-php72 libmcrypt libmcrypt-devel php php-mcrypt php-fpm composer \
	php-pecl-xdebug php-devel php-mbstring php-pdo php-gd  libffi-devel \
	php-mcrypt php-zlib php-zip php-mysql  php-xml php-curl vim tree net-tools bind-utils ngrep nc

grep Asia\/Tokyo /etc/php.ini
if [ $1 -ne '']; then
  echo "date.timezone = Asia/Tokyo" >> /etc/php.ini
fi

if [ -e /var/cache/nginx/.composer ]; then
  mkdir  /var/cache/nginx/.composer
  chown -R nginx. /var/cache/nginx/.composer
fi

systemctl enable nginx
systemctl enable php-fpm
systemctl start nginx
systemctl start php-fpm

yum remove -y httpd
yum update -y
# reboot

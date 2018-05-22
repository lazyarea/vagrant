#!/bin/bash

systemctl enable nginx
systemctl enable mariadb
systemctl enable mariadb-server

firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --permanent --add-port=3306/tcp
firewall-cmd --reload


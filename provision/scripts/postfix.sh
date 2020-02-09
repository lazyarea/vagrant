#!/bin/sh

yum install -y postfix dovecot

ls /etc/postfix/main.cf.org{,.org} > /dev/null 2>&1
if [ $? -ne 1 ]; then
cp -p /etc/postfix/main.cf{,.org}

fi

ls /etc/dovecot/conf.d/10-mail.conf.org > /dev/null 2>&1
if [ $? -ne -1 ]; then
cp -p /etc/dovecot/conf.d/10-mail.conf{,.org}
sed -i 's/^#mail_location\ =/mail_location =\ maildir:~\/Maildir/' /etc/dovecot/conf.d/10-mail.conf
sed -i 's/^#valid_chroot_dirs =/valid_chroot_dirs = \/home/' /etc/dovecot/conf.d/10-mail.conf
sed -i 's/^#disable_plaintext_auth = yes/disable_plaintext_auth = no/' /etc/dovecot/conf.d/10-mail.conf
cp -p  /etc/dovecot/conf.d/10-ssl.conf{,.org}
sed -i 's/^#ssl = yes/ssl = no/' /etc/dovecot/conf.d/10-ssl.conf
/etc/init.d/dovecot restart
chkconfig dovecot on
fi

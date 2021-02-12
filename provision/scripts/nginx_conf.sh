#!/bin/bash
yum install -y nginx
cp /etc/nginx/conf.d/default.conf{,.org}
cat > /etc/nginx/conf.d/default.conf << 'NGINX'
server {
    listen       *:80;
    server_name  localhost;
    #charset koi8-r;
    access_log  /var/log/nginx/xxxxx-access.log  main;
    error_log   /var/log/nginx/xxxxx-error.log;
    root   /var/www/xxxxx/webroot;
    index  index.php index.html index.htm;
    location / {
        try_files $uri $uri?$args $uri/ /index.php?$uri&$args /index.php?$args;
    }
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_pass   unix:/var/run/php-fpm/php-fpm.sock;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        fastcgi_param  CAKEPHP_ENV 'local';
        fastcgi_read_timeout 120;
        include        fastcgi_params;
    }
    location = /favicon.ico {
        error_page    404 = @favicon;
        access_log    off;
        log_not_found off;
    }
    location @favicon {
        empty_gif;
        access_log    off;
        log_not_found off;
    }
}
NGINX

cp -p /etc/nginx/nginx.conf{,.org}
sed -i 's/sendfile.*/sendfile off;/' /etc/nginx/nginx.conf

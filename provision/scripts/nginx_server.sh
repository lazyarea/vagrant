#!/bin/bash

cp /etc/nginx/conf.d/default.conf{,.org}
cat > /etc/nginx/conf.d/default.conf << NGINX
server {
    listen       80;
    server_name  localhost;

    #charset koi8-r;
    access_log  /var/log/nginx/system.access.log  main;
    error_log   /var/log/nginx/system.error.log   info;

    root   /vagrant/system;

    location / {
        #root   /vagrant/system;
        index  index.php index.html index.htm;
    }

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    # proxy the PHP scripts to Apache listening on 127.0.0.1:80
    #
    #location ~ \.php$ {
    #    proxy_pass   http://127.0.0.1;
    #}

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    location ~ \.php$ {
#        root           html;
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
#        fastcgi_param  SCRIPT_FILENAME  /scripts\$fastcgi_script_name;
        fastcgi_param  SCRIPT_FILENAME  \$document_root/\$fastcgi_script_name;
        include        fastcgi_params;
    }

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    #
    #location ~ /\.ht {
    #    deny  all;
    #}
}
server {
    listen       8080;
    server_name  localhost;

    #charset koi8-r;
    access_log  /var/log/nginx/bukken.access.log  main;
    error_log   /var/log/nginx/bukken.error.log   info;

    root   /vagrant/bukken;

    location / {
        #root   /vagrant/bukken;
        index  index.php index.html index.htm;
    }

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    # proxy the PHP scripts to Apache listening on 127.0.0.1:80
    #
    #location ~ \.php$ {
    #    proxy_pass   http://127.0.0.1;
    #}

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    location ~ \.php$ {
#        root           html;
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
#        fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
        fastcgi_param  SCRIPT_FILENAME  $document_root/$fastcgi_script_name;
        include        fastcgi_params;
    }

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    #
    #location ~ /\.ht {
    #    deny  all;
    #}
}
NGINX

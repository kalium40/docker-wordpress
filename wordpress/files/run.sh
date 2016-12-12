#!/bin/bash
if [ "$(ls -A /var/www/wordpress)" ]; then
       chown -R www-data:www-data /var/www/wordpress
else
       wget https://ja.wordpress.org/latest-ja.zip -P /var/www && unzip /var/www/latest-ja.zip -d /var/www/
       chown -R www-data:www-data /var/www/wordpress
fi
/usr/sbin/php5-fpm -D && /usr/sbin/nginx

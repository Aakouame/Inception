#!/bin/bash

sleep 5

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    wp config create --allow-root \
        --dbname=db \
        --dbuser=Aissa \
        --dbpass=123+ \
        --dbhost=mariadb:3306 \
        --path='/var/www/wordpress'
fi

wp core install --allow-root \
    --url=http://localhost \
    --title="Inception WordPress Site" \
    --admin_user=admin \
    --admin_password=123+ \
    --admin_email=aissakouame3@gmail.com \
    --path='/var/www/wordpress'

wp user create --allow-root \
    user2 \
    aissakouame4@gmail.com \
    --user_pass=0000 \
    --role=author \
    --path='/var/www/wordpress'

if [ ! -d "/run/php" ]; then
    mkdir /run/php
fi

sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = 9000|' /etc/php/7.3/fpm/pool.d/www.conf

exec /usr/sbin/php-fpm7.3 -F


# sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf
# sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = 9000|' /etc/php/7.3/fpm/pool.d/www.conf
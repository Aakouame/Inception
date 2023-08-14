#!/bin/bash

sleep 10

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    wp config create --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306 \
        --path='/var/www/wordpress'
fi

wp core install --allow-root \
    --url=http://localhost \
    --title="Inception WordPress Site" \
    --admin_user=admin \
    --admin_password=admin123+ \
    --admin_email=aissakouame3@gmail.com \
    --path='/var/www/wordpress'

wp user create --allow-root \
    user1 \
    aissakouame4@gmail.com \
    --user_pass=user123+ \
    --role=author \
    --path='/var/www/wordpress'

wp user create --allow-root \
    user2 \
    aissakouame5@gmail.com \
    --user_pass=user234+ \
    --role=author \
    --path='/var/www/wordpress'

if [ ! -d "/run/php" ]; then
    mkdir /run/php
fi

/usr/sbin/php-fpm7.3 -F

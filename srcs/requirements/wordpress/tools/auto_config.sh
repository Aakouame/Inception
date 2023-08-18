#!/bin/sh

sleep 10

wp core download --allow-root --path='/var/www/wordpress' 
cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

sed -i "s|database_name_here|$SQL_DATABASE|"  /var/www/wordpress/wp-config.php
sed -i "s|username_here|$SQL_USER|"  /var/www/wordpress/wp-config.php
sed -i "s|password_here|$SQL_PASSWORD|"  /var/www/wordpress/wp-config.php
sed -i "s|localhost|mariadb:3306|"  /var/www/wordpress/wp-config.php

wp core install --allow-root \
    --url=http://localhost \
    --title="Inception WordPress Site" \
    --admin_user=$WP_ADMIN \
    --admin_password=$WP_PASSWORD \
    --admin_email=$WP_EMAIL \
    --path='/var/www/wordpress'

wp user create --allow-root \
    $WP_USER \
    $WP_EMAIL_USER \
    --user_pass=$WP_PASSWORD_USER \
    --role=author \
    --path='/var/www/wordpress'

if [ ! -d "/run/php" ]; then
    mkdir -p /run/php
fi

sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = 9000|' /etc/php/7.3/fpm/pool.d/www.conf

exec /usr/sbin/php-fpm7.3 -F

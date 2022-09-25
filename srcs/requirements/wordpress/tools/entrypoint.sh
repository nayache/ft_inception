#!/bin/bash


if [ ! -f /var/www/html/wordpress/wp-config.php ]
then
    chown -R www-data:www-data /var/www/*
    service php7.3-fpm start;
    ## download wordpress
    wp core download --allow-root --path="/var/www/html/wordpress";
    chown -R www-data:www-data /var/www/*
    ## creation wp-config.php
    wp config create --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --allow-root --path="/var/www/html/wordpress";
    ## installation wordpress
    wp core install --url=https://nayache.42.fr --title="==>INCEPTION<==" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root --path="/var/www/html/wordpress";
    ## creation second user wordpress
    wp user create $WP_USER $WP_EMAIL --user_pass=$WP_PASSWORD --allow-root --path="/var/www/html/wordpress";
    
    service php7.3-fpm stop;
else
    echo "==> Wordpress is already installed"
fi

php-fpm7.3 -F;
#!/bin/bash

chown -R www-data:www-data /var/www/*
service php7.3-fpm start;

if [ ! -f /var/www/html/wordpress/wp-config.php ]
then
    wp core download --allow-root --path="/var/www/html/wordpress";
    chown -R www-data:www-data /var/www/*
    wp config create --dbname=wordpress --dbuser=nayache --dbpass=pass --dbhost=mariadb --allow-root --path="/var/www/html/wordpress";
    wp core install --url=https://nayache.42.fr --title="==>INCEPTION<==" --admin_user=nayache --admin_password=pass --admin_email=nana@gmail.com --skip-email --allow-root --path="/var/www/html/wordpress"
else
    echo "==> Wordpress is already installed"
fi

service php7.3-fpm stop;
php-fpm7.3 -F;
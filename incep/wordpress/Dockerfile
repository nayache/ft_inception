FROM debian:buster

RUN apt update && apt install -y curl php7.3 php-fpm php-mysqli php-mysql

COPY www.conf /etc/php/7.3/fpm/pool.d/

RUN apt install -y mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar \
   && mv wp-cli.phar /usr/bin/wp

RUN mkdir -p /var/www/html/wordpress
# #RUN wp core download --allow-root --path="/var/www/html/wordpress"

# RUN chown -R www-data:www-data /var/www/*

# #RUN wp config create --dbname=wordpress --dbuser=nayache --dbpass=pass --dbhost=mariadb --allow-root --path="/var/www/html/wordpress"
COPY wp-config.php /var/www/html/wordpress
# RUN chown -R www-data:www-data /var/www/*

# RUN wp core install --url=https://nayache.42.fr --title=wordpress --admin_user=nayache --admin_password=pass --admin_email=nana@gmail.com --skip-email --allow-root --path="/var/www/html/wordpress"

COPY wpinstall.sh .

ENTRYPOINT ["bash", "wpinstall.sh"]

FROM debian:buster

RUN apt update && apt install -y nginx openssl vim curl

COPY nginx.conf /etc/nginx/sites-enabled/default

RUN mkdir /etc/nginx/ssl && \
	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/nginx.pem -keyout /etc/nginx/ssl/nginx.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=nayache/CN=nayache.42.fr/"

RUN apt install -y php7.3 php-fpm php-mysqli php-mysql

COPY www.conf /etc/php/7.3/fpm/pool.d

RUN apt install -y mariadb-server mariadb-client

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/

COPY init.sql .
#COPY script.sh .

RUN service mysql start && mysql -u root < init.sql

# FICHER CONFIG PHPFPM BIND LE SOCK AVEC LE FICHIER CONF DEFAULT /ETC/NGINX/SITES...

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar \
   && mv wp-cli.phar /usr/bin/wp

RUN mkdir /var/www/html/wordpress
RUN wp core download --allow-root --path="/var/www/html/wordpress"

RUN chown -R www-data:www-data /var/www/*

RUN service mysql start && \
 	wp config create --dbname=wordpress --dbuser=nayache --dbpass=pass --dbhost=localhost --allow-root --path="/var/www/html/wordpress"

RUN chown -R www-data:www-data /var/www/*

RUN service mysql start && wp core install --url=https://nayache.42.fr --title=wordpress --admin_user=nayache --admin_password=pass --admin_email=nana@gmail.com --skip-email --allow-root --path="/var/www/html/wordpress"

CMD service nginx start && service mysql start && service php7.3-fpm start && sleep infinity
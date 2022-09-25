FROM debian:buster

RUN apt update && apt install -y curl php7.3 php-fpm php-mysqli php-mysql

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN apt install -y mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/bin/wp

RUN mkdir -p /var/www/html/wordpress

COPY tools/entrypoint.sh .

ENTRYPOINT ["bash", "entrypoint.sh"]

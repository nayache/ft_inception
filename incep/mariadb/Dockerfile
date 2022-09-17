FROM debian:buster

RUN apt update && apt install -y mariadb-server mariadb-client

COPY init.sql .
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/
COPY 50-server.cnf /etc/mysql/mariadb/

RUN service mysql start && mysql -u root < init.sql

ENTRYPOINT mysqld

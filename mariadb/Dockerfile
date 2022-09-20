FROM debian:buster

RUN apt update && apt install -y mariadb-server mariadb-client

COPY init.sql .
COPY setup.sh /usr/bin/
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/
COPY 50-server.cnf /etc/mysql/mariadb/

ENTRYPOINT ["bash", "setup.sh"]
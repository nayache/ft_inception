FROM debian:buster

RUN apt update && apt install -y mariadb-server mariadb-client

COPY tools/setup.sh .
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

ENTRYPOINT ["bash", "setup.sh"]
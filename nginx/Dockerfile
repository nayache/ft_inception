FROM debian:buster

RUN apt update && apt install -y nginx openssl vim curl

COPY nginx.conf /etc/nginx/sites-enabled/default

RUN mkdir /etc/nginx/ssl && \
	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/nginx.pem -keyout /etc/nginx/ssl/nginx.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=nayache/CN=nayache.42.fr/"

CMD ["nginx", "-g", "daemon off;"]

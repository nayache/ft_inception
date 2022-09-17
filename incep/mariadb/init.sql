CREATE DATABASE wordpress;
CREATE USER 'nayache'@'%' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON wordpress.* TO 'nayache'@'%';
FLUSH PRIVILEGES;

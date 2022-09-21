if [ ! -d "/var/lib/mysql/$DB_NAME" ]
then
    service mysql start;
   mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
   mysql -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
   mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${MYSQL_USER}'@'%';"
   mysql -u root -e "FLUSH PRIVILEGES;"
   mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';"
   service mysql stop;
else
    echo "==> Database already exists";
fi

mysqld;
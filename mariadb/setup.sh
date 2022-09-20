service mysql start;

if [ ! -d "/var/lib/mysql/$DB_NAME" ]
then
    mysql -u root < init.sql;
else
    echo "==> Database already exists";
fi

service mysql stop;
mysqld;
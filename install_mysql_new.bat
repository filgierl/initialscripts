## Instalacja bazy mysql
apt-get install mysql-server mysql-client -y
systemctl enable mysql
systemctl restart mysql
## Inicjalizacja bazy danych
mysql 
CREATE DATABASE dolibarr  DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
CREATE DATABASE wordpress  ;
create user 'wordpress_user'@'%' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON `dolibarr`.* TO 'dolibarr'@'%' IDENTIFIED BY 'adminqwas@123';
GRANT ALL PRIVILEGES ON `wordpress`.* TO 'wordpress_user'@'%' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON `replikant`.* TO 'replikant'@'%' IDENTIFIED BY 'admin123';
GRANT REPLICATION SLAVE ON *.* TO 'replikant'@'%' IDENTIFIED BY 'admin123';
CREATE USER 'maxscale'@'%' IDENTIFIED BY 'admin123';
GRANT SELECT ON mysql.user TO 'maxscale'@'%';
GRANT SELECT ON mysql.db TO 'maxscale'@'%';
GRANT SELECT ON mysql.tables_priv TO 'maxscale'@'%';
GRANT RELOAD, PROCESS, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'maxscale'@'%';
GRANT SHOW DATABASES ON *.* TO 'maxscale'@'%';
FLUSH PRIVILEGES;
exit
## Wczytanie baz z danymi

mysql -u root dolibarr < /home/ubuntu/initialscripts/files/dolibarr.sql
mysql -u root wordpress </home/ubuntu/initialscripts/files/wordpress.sql
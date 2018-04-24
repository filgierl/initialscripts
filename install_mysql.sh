sudo su
apt-get update -y
apt-get install mc nano net-tools -y
git clone https://github.com/filgierl/initialscripts.git
##Instalacja bazy mysql oraz inicjalizacja użytkowników i bazy
apt-get install mysql-server mysql-client -y
mysql_secure_installation
##Utworzenie konfiga na podobe my.cnf.master dla master
##Utworzenie konfiga na podobe my.cnf.slave dla maszyn slave
##
##
mysql 
CREATE DATABASE dolibarr  DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
CREATE DATABASE wordpress  ;
create user 'wordpress_user'@'%' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON `dolibarr`.* TO 'dolibarr'@'%' IDENTIFIED BY 'adminqwas@123';
#GRANT ALL PRIVILEGES ON `wordpress`.* TO 'replikant'@'%' IDENTIFIED BY 'adminqwas@123';
GRANT ALL PRIVILEGES ON `wordpress`.* TO 'wordpress_user'@'%' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON `replikant`.* TO 'replikant'@'%' IDENTIFIED BY 'admin123';
GRANT REPLICATION SLAVE ON *.* TO 'replikant'@'%' IDENTIFIED BY 'admin123';
CREATE USER 'maxscale'@'%' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON . TO 'maxscale'@'%' IDENTIFIED BY 'admin123';
GRANT SELECT ON mysql.user TO 'maxscale'@'%';
GRANT SELECT ON mysql.db TO 'maxscale'@'%';
GRANT SELECT ON mysql.tables_priv TO 'maxscale'@'%';
GRANT RELOAD, PROCESS, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'maxscale'@'%';
GRANT SHOW DATABASES ON *.* TO 'maxscale'@'%';
FLUSH PRIVILEGES;
exit
#Wczytanie bazy z danymi
mysql -u root dolibarr < /home/ubuntu/initialscripts/files/mysqldump_dolibarr_7.0.0.sql

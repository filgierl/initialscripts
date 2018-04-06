sudo su
##Instalacja bazy mysql oraz inicjalizacja użytkowników i bazy
apt-get install mysql-server mysql-client
mysql_secure_installation
##Utworzenie konfiga na podobe my.cnf.master dla master
##Utworzenie konfiga na podobe my.cnf.slave dla maszyn slave
##
##
mysql 
CREATE DATABASE dolibarr  DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON `dolibarr`.* TO 'dolibarr'@'%' IDENTIFIED BY 'adminqwas@123';
GRANT ALL PRIVILEGES ON `replikant`.* TO 'replikant'@'%' IDENTIFIED BY 'admin123';
GRANT REPLICATION SLAVE ON *.* TO 'replikant'@'%' IDENTIFIED BY 'admin123';
FLUSH PRIVILEGES;
exit
#Wczytanie bazy z danymi
mysql -u root dolibarr < /home/ubuntu/mysqldump_dolibarr_7.0.0.sql

##Tworzenie backupu Wykonac TYLKO NA MASTER
 mysqldump --databases dolibarr > /home/ubuntu/dolibarr.sql
 mysql
 use dolibarr;
 #Do odczytania Position i  File
 show master status;
 exit;
##Uruchomienie replikacji na slave
#Podegranie backupu bazy z master
mysql < /home/ubuntu/dolibarr.sql
mysql
CHANGE MASTER TO
  MASTER_HOST='master.mysql',
  MASTER_USER='replikant',
  MASTER_PASSWORD='admin123',
  MASTER_PORT=3306,
  MASTER_LOG_FILE='mysql-bin.000001',
  MASTER_LOG_POS=2737424,
  MASTER_CONNECT_RETRY=10;
START SLAVE;
SHOW SLAVE STATUS\G



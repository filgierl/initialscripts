apt-get update
apt-get install mysql-client curl php-curl php-gd php-curl  php-xml apache2 apache2-bin apache2-data  libaio1 libapache2-mod-php libapr1 libaprutil1 php mc nano net-tools php-cli php-common php-json php-mysql php-readline libapache2-mod-php php-mcrypt php-cli php-zip -y
git clone https://github.com/filgierl/initialscripts.git
tar zvxf initialscripts/files/dolibarr-7.0.0.tgz
mv initialscripts/files/dolibarr /var/www
mkdir -p /var/www/dolibarr/documents
chown -R www-data:www-data /var/www/dolibarr/
##dodać config do /etc/apache2/sites-available dolibarr.conf
a2ensite dolibarr
service apache2 reload

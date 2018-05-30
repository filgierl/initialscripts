apt-get update
apt-get install mysql-client curl php-curl php-gd php-curl  php-xml apache2 apache2-bin apache2-data  libaio1 libapache2-mod-php libapr1 libaprutil1 php mc nano net-tools php-cli php-common php-json php-mysql php-readline libapache2-mod-php php-mcrypt php-cli php-zip -y
git clone https://github.com/filgierl/initialscripts.git
cd /home/ubuntu/initialscripts/files
mkdir dolibarr
tar xf dolibarr-7.0.0.tgz -C dolibarr
mv dolibarr/dolibarr-7.0.0/dolibarr/ /var/www/
mkdir -p /var/www/dolibarr/documents
chown -R www-data:www-data /var/www/dolibarr/
cp sites.conf  /etc/apache2/sites-available/
a2dissite 000-default
rm /etc/apache2/sites-available/000-default.conf
a2ensite sites
service apache2 reload

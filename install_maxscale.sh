##Instalacja maxscale
dpkg -i maxscale-2.2.3-1.ubuntu.xenial.x86_64.deb
apt-get install -f
#Wytworzenie configa na podobe maxscale.cnf (jeżeli dojdzie więcej slave to dodać)
service maxscale start

sudo apt update -y
sudo apt install -y nginx git vsftpd
sudo apt-get upgrade -y

sudo  systemctl enable nginx  
sudo  systemctl start nginx    


#sitio web inicial
sudo  mkdir -p /var/www/daninginx/html

sudo  git clone https://github.com/cloudacademy/static-website-example /var/www/daninginx/html

sudo  chown -R www-data:www-data /var/www/
sudo  chmod -R 775 /var/www/


sudo cp /vagrant/daninginx /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/daninginx /etc/nginx/sites-enabled/



#instalacion del segundo sitio web





#permisos  y usuario FTP

sudo adduser dani
echo "dani:dani" | sudo chpasswd


sudo mkdir -p /home/dani/ftp
sudo chown dani:dani /home/dani/ftp
sudo chmod 775 /home/dani/ftp



#claves para el certificado
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=ES/ST=Granada/L=Granada/O=Global Security/OU=IES ZAIDIN VERGELES/CN=exploreX.test"

sudo cp -v /vagrant/vsftpd.conf /etc/vsftpd.conf

sudo systemctl start vsftpd

sudo usermod -aG www-data dani

#carpeta para FileZilla
sudo mkdir -p  /var/www/danijugger/html

cp /vagrant/danijugger /etc/nginx/sites-available/danijugger

sudo ln -s /etc/nginx/sites-available/danijugger /etc/nginx/sites-enabled/
sudo systemctl restart nginx
sudo systemctl restart vsftpd





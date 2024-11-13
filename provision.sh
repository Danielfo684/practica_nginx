sudo apt update -y
sudo apt install -y nginx git 

sudo  systemctl enable nginx  
sudo  systemctl start nginx    


#sitio web inicial
sudo  mkdir -p /var/www/daninginx/html

sudo  git clone https://github.com/cloudacademy/static-website-example /var/www/daninginx/html

sudo  chown -R www-data:www-data /var/www/daninginx/html
sudo  chmod -R 775 /var/www/daninginx


sudo cp /vagrant/daninginx /etc/nginx/sites-available/daninginx
sudo ln -s /etc/nginx/sites-available/daninginx /etc/nginx/sites-enabled/


sudo  nginx -t

sudo  systemctl restart nginx


#instalacion del segundo sitio web

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y vsftpd

sudo adduser dani

echo "dani:dani" | sudo chpasswd


sudo mkdir /home/dani/ftp
sudo chown vagrant:vagrant /home/dani/ftp
sudo chmod 775 /home/dani/ftp


if [ ! -f /etc/ssl/certs/vsftpd.crt ]; then
    sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=ES/ST=Granada/L=Granada/O=IESZaidinVergeles/CN=192.168.10.15"
fi

cp /vagrant/vsftpd.conf /etc/vsftpd.conf

sudo usermod -aG www-data dani

sudo mkdir -p  /var/www/danijugger
sudo chown -R www-data:www-data /var/www/danijugger
sudo chmod -R 775 /var/www/danijugger

sudo systemctl restart vsftpd

sudo git clone https://github.com/Danielfo684/danielfo684.github.io.git /var/www/danijugger

sudo chmod -R 775 /var/www/danijugger

cp /vagrant/danijugger /etc/nginx/sites-available/danijugger


sudo ln -s /etc/nginx/sites-available/danijugger /etc/nginx/sites-enabled/
sudo systemctl restart nginx
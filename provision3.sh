sudo mkdir -p  /var/www/acceso-seguro/html

sudo cp /vagrant/acceso-seguro /etc/nginx/sites-available/

sudo ln -s /etc/nginx/sites-available/acceso-seguro /etc/nginx/sites-enabled/

sudo ufw allow ssh
sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'
sudo ufw --force enable


sudo openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 -keyout /etc/ssl/private/acceso-seguro.com.key \
    -out /etc/ssl/certs/acceso-seguro.com.crt



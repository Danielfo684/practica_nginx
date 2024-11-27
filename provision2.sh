sudo chown -R www-data:www-data /var/www/
sudo chmod -R 775 /var/www/


sudo sh -c "echo -n 'dani:' >> /etc/nginx/.htpasswd"
sudo sh -c "openssl passwd -apr1 '123' >> /etc/nginx/.htpasswd"
sudo sh -c "echo -n 'fontalva:' >> /etc/nginx/.htpasswd"
sudo sh -c "openssl passwd -apr1 'fontalva' >> /etc/nginx/.htpasswd"


#los archivos los he metido utilizando FileZilla

sudo mkdir -p  /var/www/deaw/html/simple-static-website
sudo cp /vagrant/deaw /etc/nginx/sites-available/



sudo chown -R www-data:www-data /var/www/deaw/
sudo chmod -R 775 /var/www/deaw/


sudo ln -s /etc/nginx/sites-available/deaw /etc/nginx/sites-enabled/

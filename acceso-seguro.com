server {
  listen 80;
  listen 443 ssl;
  server_name acceso-seguro.com www.acceso-seguro.com;
  root /var/www/acceso-seguro.com/html;
  ssl_certificate /etc/ssl/certs/acceso-seguro.com.crt;
  ssl_certificate_key /etc/ssl/private/acceso-seguro.com.key;
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
  ssl_ciphers HIGH:!aNULL:!MD5;
  location / {
  try_files $uri $uri/ =404;
  }
}

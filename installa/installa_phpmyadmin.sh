#!bin/bash

# Instalar el servidor web Apache
sudo dnf install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd

# Instalar la base de datos MariaDB
sudo dnf install -y mariadb mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation

# Instalar php y dependencias
sudo dnf install php php-common php-pdo_mysql php-pdo php-gd php-mbstring -y

# Reiniciar el servidor Apache para aplicar los cambios
sudo systemctl restart httpd

# Instalar el paquete de phpMyAdmin
sudo dnf install phpMyAdmin -y
# se ejecuta de base
#!/bin/bash
# Update server
sudo su
apt-get update
apt-get upgrade -y
# Install essentials
apt-get -y install build-essential binutils-doc git -y
# Install Apache
apt-get install apache2 -y

# Restart Apache service
service apache2 restart

a2enmod ssl

a2ensite web1.conf
a2ensite web2.conf
a2ensite web3.conf

echo "Listen 8081" >> /etc/apache2/ports.conf
echo "Listen 8082" >> /etc/apache2/ports.conf
echo "Listen 8083" >> /etc/apache2/ports.conf
echo "Listen 8084" >> /etc/apache2/ports.conf
echo "Listen 8443" >> /etc/apache2/ports.conf


ufw allow 8081
ufw allow 8082
ufw allow 8083
ufw allow 8084
ufw allow 443
ufw allow 8443

sudo service apache2 restart
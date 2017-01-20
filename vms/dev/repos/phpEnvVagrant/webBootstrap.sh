# Update package manager
sudo apt-get update

# Install apache
sudo apt-get install apache2 -y

# Install curl
sudo apt-get install curl -y
sudo apt-get install php5-curl -y

# Install PHP
sudo apt-get install libapache2-mod-php5 -y

# Install mysql drivers for php
sudo apt-get install php5-mysql -y

# Install various php tools
sudo apt-get install pkg-php-tools -y

# Install composer (PHP package manager)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '61069fe8c6436a4468d0371454cf38a812e451a14ab1691543f25a9627b97ff96d8753d92a00654c21e2212a5ae1ff36') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# Install git
sudo apt-get install git -y

# Restart apache to apply changes
sudo service apache2 restart

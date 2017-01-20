# Update package manager
sudo apt-get update
# Preset mysql root password
sudo debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password password $1"
sudo debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password_again password $1"

#install mysql
sudo apt-get install mysql-server-5.7 -y

# Grant privileges for remote user connections
mysql -u root -p$1 <<< "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$1' WITH GRANT OPTION;"

# Modify mysql cnf to allow remote user connections
sudo sed -i 's/bind-address/\#&/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart mysql service to load new config
sudo service mysql restart

echo "Database VM running at 192.168.13.201 $2 with user 'root' and password '$1'"

sudo apt update
echo ""
echo "Starting Service ....."
#sudo service mariadb start start
echo ""
echo "Setting root password"
echo ""
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'GNGC-PASS';" 2>/dev/null
sudo mysql -e "FLUSH PRIVILEGES;" 2>/dev/null
echo "Root password set successfully."
mysql -e "CREATE DATABASE IF NOT EXISTS gngcmain;" -u root -p"GNGC-PASS" 2>/dev/null
echo ""
echo "Created default user database"
echo ""
sudo systemctl stop mariadb
#!/bin/bash

sudo apt update
echo ""
echo "Installing ....."
sudo apt install -y mariadb-server
sudo service mysql start

# Set the root password for MariaDB
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'GNGC-PASS';"

# Run the secure installation non-interactively
sudo mysql_secure_installation <<EOF

# Respond to the prompts automatically
Y
GNGC-PASS
GNGC-PASS
Y
Y
Y
Y
EOF

echo "MariaDB secure installation completed."
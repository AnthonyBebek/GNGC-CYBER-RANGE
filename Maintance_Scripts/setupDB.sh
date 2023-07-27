#!/bin/bash

# Function to set the root password
set_root_password() {
    mysqladmin -u root password "GNGC-MYSQL"
    echo "Root password set successfully."
}

# Function to apply temporary MySQL configuration changes
apply_mysql_config_fix() {
    echo "Applying MySQL configuration fix..."
    sudo cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf.backup
    sudo sh -c "echo '[mysqld]' >> /etc/mysql/mysql.conf.d/mysqld.cnf"
    sudo sh -c "echo 'skip-grant-tables' >> /etc/mysql/mysql.conf.d/mysqld.cnf"
    sudo systemctl restart mysql
}

# Function to create a new user or update the password if the user already exists
create_or_update_user() {
    local current_user=$(whoami)
    local new_password="pass"

    echo "Creating new user: $current_user"
    echo "New password: $new_password"

    mysql --user=root --password=GNGC-MYSQL <<MYSQL_SCRIPT
CREATE OR REPLACE USER '$current_user'@'localhost' IDENTIFIED BY '$new_password';
GRANT ALL PRIVILEGES ON *.* TO '$current_user'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

    echo ""
    echo "New account has been created or updated!"
}

# Function to revert MySQL configuration changes
revert_mysql_config_fix() {
    echo "Reverting MySQL configuration..."
    sudo cp /etc/mysql/mysql.conf.d/mysqld.cnf.backup /etc/mysql/mysql.conf.d/mysqld.cnf
    sudo systemctl restart mysql
}

# Main script starts here
set_root_password
apply_mysql_config_fix
create_or_update_user
revert_mysql_config_fix

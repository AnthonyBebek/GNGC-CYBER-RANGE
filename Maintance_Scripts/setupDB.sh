#!/bin/bash

set_root_password() {
    sudo apt update
    echo ""
    echo "Installing ....."
    sudo apt install -y mariadb-server
    sudo service mysql start
    echo ""
    echo "Setting root password"
    sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'GNGC-PASS';"
    sudo mysql -e "FLUSH PRIVILEGES;"
    echo "Root password set successfully."
}

set_root_password
echo ""
<<com
create_or_update_user() {
    local current_user="systems"
    #$(whoami)
    local new_password="pass"

    echo "Creating new user: $current_user"
    echo "New password: $new_password"

    mysql --user=root --password=GNGC-PASS --socket=/var/run/mysqld/mysqld.sock -e "
        CREATE OR REPLACE USER '$current_user'@'localhost' IDENTIFIED BY '$new_password';
        GRANT ALL PRIVILEGES ON *.* TO '$current_user'@'localhost';
        FLUSH PRIVILEGES;
    "

    echo ""
    echo "New account has been created or updated!"
}

create_or_update_user

com

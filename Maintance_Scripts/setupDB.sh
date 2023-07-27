#!/bin/bash

# Function to set the root password
set_root_password() {
    mysql_config_editor set --login-path=local --user=root --password
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'GNGC-MYSQL';"
    echo "Root password set successfully."
}

# Function to create a new user or update the password if the user already exists
create_or_update_user() {
    local current_user=$(whoami)
    local new_password="pass"

    echo "Creating new user: $current_user"
    echo "New password: $new_password"

    mysql --login-path=local -e "CREATE OR REPLACE USER '$current_user'@'localhost' IDENTIFIED BY '$new_password';"
    mysql --login-path=local -e "GRANT ALL PRIVILEGES ON *.* TO '$current_user'@'localhost';"
    mysql --login-path=local -e "FLUSH PRIVILEGES;"

    echo ""
    echo "New account has been created or updated!"
}

# Main script starts here
set_root_password
create_or_update_user

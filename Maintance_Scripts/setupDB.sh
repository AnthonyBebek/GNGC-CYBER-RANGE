#!/bin/bash

set_root_password() {
    mysqladmin -u root password "GNGC-MYSQL"
    echo "Root password set successfully."
}

create_or_update_user() {
    local current_user=$(whoami)
    local new_password="pass"

    echo "Creating new user: $current_user"
    echo "New password: $new_password"

    mysql --user=root --password=GNGC-MYSQL --socket=/path/to/mysql.sock <<MYSQL_SCRIPT
CREATE OR REPLACE USER '$current_user'@'localhost' IDENTIFIED BY '$new_password';
GRANT ALL PRIVILEGES ON *.* TO '$current_user'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

    echo ""
    echo "New account has been created or updated!"
}


set_root_password
create_or_update_user

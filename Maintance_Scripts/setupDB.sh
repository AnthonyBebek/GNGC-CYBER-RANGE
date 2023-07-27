#!/bin/bash

current_user=$(whoami)
new_password="pass"

echo "Creating new user: $current_user"
echo "New password: $new_password"

bash set_root_password.sh

user_exists=$(mysql --defaults-extra-file=<(echo -e "[client]\nuser=root\npassword=your_new_root_password") -N -s -e "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$current_user' AND host = 'localhost');")

if [ "$user_exists" -eq 1 ]; then
    echo "User '$current_user' already exists. Deleting..."
    mysql --defaults-extra-file=<(echo -e "[client]\nuser=root\npassword=your_new_root_password") -e "DROP USER '$current_user'@'localhost';"
fi

tmp_cnf=$(mktemp)
echo "[client]" >> "$tmp_cnf"
echo "user=root" >> "$tmp_cnf"
echo "password=your_new_root_password" >> "$tmp_cnf"

mysql --defaults-extra-file="$tmp_cnf" <<MYSQL_SCRIPT
CREATE USER '$current_user'@'localhost' IDENTIFIED BY '$new_password';
GRANT ALL PRIVILEGES ON *.* TO '$current_user'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

rm "$tmp_cnf"

echo ""
echo "New account has been created!"

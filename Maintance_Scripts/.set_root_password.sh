#!/bin/bash

root_password="GNGC-MYSQL"

# Set the root password for MySQL using mysqladmin
mysqladmin -u root password "$root_password"

echo "Root password set successfully."
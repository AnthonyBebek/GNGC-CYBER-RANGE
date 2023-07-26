#!/bin/bash

end_message() {
    echo ""
    echo "If there was an error, then it's recommended to restart the script and agree to update installers."
    echo ""
}

update_installers() {
    echo "Updating Installers..."
    sudo apt update
    pip3 install --upgrade
    end_message
}

install_python_dependencies() {
    echo "Installing Python dependencies..."
    pip3 install flask
    pip3 install flask_login
    pip3 install werkzeug
    pip3 install sqlalchemy
    pip3 install re
    pip3 install socket
    pip3 install sys
    pip3 install os
    pip3 install time
    pip3 install threading
    pip3 cache purge
}

install_other_dependencies() {
    echo "Installing other dependencies..."
    sudo apt install mariadb-server mariadb-client -y
    sudo apt-get install -y iputils-ping
}

read -p "Do you want to update apt and pip? (Recommended) (Y/N): " python_choice
if [[ "$python_choice" =~ ^[Yy]$ ]]; then
    update_installers
fi

read -p "Do you want to install Python dependencies? (Y/N): " python_choice
if [[ "$python_choice" =~ ^[Yy]$ ]]; then
    install_python_dependencies
    end_message
fi

read -p "Do you want to install other dependencies? (Y/N): " other_choice
if [[ "$other_choice" =~ ^[Yy]$ ]]; then
    install_other_dependencies
    end_message
fi

echo "Done!"

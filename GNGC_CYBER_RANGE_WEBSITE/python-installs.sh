#!/bin/bash

end_message(){
    echo ""
    echo "If there was an error then it's recommended to restart the script and agree to update installers"
    echo ""
}

update_installers() {
    echo "Updating Installers..."
    sudo apt update
    pip3 install --upgrade
}

install_python_dependencies() {
    echo "Installing Python dependencies..."
    pip3 install flask
    pip3 install flask_login
    pip3 install werkzeug
    pip3 install sqlalchemy
    pip3 install re
    pip3 cache purge
    end_message
}

install_other_dependencies() {
    echo "Installing other dependencies..."
    sudo apt install mariadb-server
    end_message
}

read -p "Do you want to update apt and pip? (Recommended) (Y/N): " python_choice
if [[ "$python_choice" =~ ^[Yy]$ ]]; then
    update_installers
fi

read -p "Do you want to install Python dependencies? (Y/N): " python_choice
if [[ "$python_choice" =~ ^[Yy]$ ]]; then
    install_python_dependencies
fi

read -p "Do you want to install other dependencies? (Y/N): " other_choice
if [[ "$other_choice" =~ ^[Yy]$ ]]; then
    install_other_dependencies
fi
echo "Done!"
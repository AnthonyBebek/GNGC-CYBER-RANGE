#!/bin/bash

set_permissions() {
    echo ""
    echo "Making files executeable"
    echo ""
    sudo chmod +x setup.sh
    sudo chmod +x start.sh
    sudo chmod +x stop.sh
    echo "Changing permissions for files"    
    echo ""
    sudo chmod 700 Maintance_Scripts
    sudo chmod 700 GNGC_CYBER_RANGE_WEBSITE
    sudo chmod 700 GNGC_CYBER_RANGE_SCRIPTS
    sudo chmod 700 setup.bat
    sudo chmod 700 setup.sh
    sudo chmod 700 setupcheck.sh
    sudo chmod 700 start.sh
    sudo chmod 700 stop.sh
    echo "Permissions set!"
}

end_message() {
    echo ""
    echo "If there was an error, then it's recommended to restart the script and agree to update installers."
    echo ""
}

update_installers() {
    echo "Updating Installers..."
    #sudo apt update
    python -m pip install --upgrade pip --no-warn-script-location
    echo ""
}

install_python_dependencies() {
    echo "Installing Python dependencies..."
    sudo python3 -m pip install flask
    sudo python3 -m pip install flask_login
    sudo python3 -m pip install bcrypt
    sudo python3 -m pip install sqlalchemy
    sudo python3 -m pip install re
    sudo python3 -m pip install validate_email
    sudo python3 -m pip install mysqlclient
    sudo python3 -m pip install pymysql
    sudo python3 -m pip install validate_email
    sudo python3 -m pip install python-dotenv
    sudo python3 -m pip cache purge

}


install_other_dependencies() {
    echo "Installing other dependencies..."
    echo ""
    echo "Installing and configuing database"
    echo ""
    #sudo apt install mariadb-server
    echo ""
    sudo ./Maintance_Scripts/setupDB.sh
    #sudo apt-get install -y iputils-ping
    #sudo apt install python3
    #sudo apt install python3-pip
    echo ""
    sudo ./Maintance_Scripts/setupWSGI.sh
}

install_other_dependencies
end_message
update_installers
install_python_dependencies
end_message

cd ~/GNGC-CYBER-RANGE/

set_permissions

echo ""
echo "Setting up custom commands"
echo ""
source ./Maintance_Scripts/setupAlias.sh

echo "Done!"

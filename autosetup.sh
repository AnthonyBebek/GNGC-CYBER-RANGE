#!/bin/bash


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

echo "Updating Installers..."
python -m pip install --upgrade pip --no-warn-script-location
echo ""

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



echo "Installing other dependencies..."
echo ""
echo "Installing and configuing database"
echo ""
echo ""
sudo ./Maintance_Scripts/setupDB.sh
echo ""
sudo ./Maintance_Scripts/setupWSGI.sh

echo ""
echo "Setting up custom commands"
echo ""
source ./Maintance_Scripts/setupAlias.sh

echo "Done!"

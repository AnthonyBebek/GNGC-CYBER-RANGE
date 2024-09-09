#!/bin/bash


echo ""
echo "Making files executeable"
echo ""
echo pwd
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
python3 -m pip install --upgrade pip --no-warn-script-location
echo ""
echo "Installing Python dependencies..."
sudo python3 -m pip install flask --break-system-packages
sudo python3 -m pip install flask_login --break-system-packages
sudo python3 -m pip install bcrypt --break-system-packages
sudo python3 -m pip install sqlalchemy --break-system-packages
sudo python3 -m pip install re --break-system-packages
sudo python3 -m pip install validate_email --break-system-packages
sudo python3 -m pip install mysqlclient --break-system-packages
sudo python3 -m pip install pymysql --break-system-packages
sudo python3 -m pip install validate_email --break-system-packages
sudo python3 -m pip install python-dotenv --break-system-packages
sudo python3 -m pip cache purge --break-system-packages

echo "Installing other dependencies..."
echo ""
#echo "Installing and configuing database"
#echo ""
#echo ""
#sudo ./Maintance_Scripts/setupDB.sh
#echo ""
sudo ./Maintance_Scripts/setupWSGI.sh

echo ""
echo "Setting up custom commands"
echo ""
source ./Maintance_Scripts/setupAlias.sh

echo "Done!"

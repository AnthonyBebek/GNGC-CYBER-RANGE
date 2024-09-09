#!/bin/bash

echo ""
#echo "Starting Database"
#sudo service mysql start
#echo ""
#bash ~/GNGC-CYBER-RANGE/autosetup.sh
#echo "Starting Webserver"
bash autosetup.sh
python3 ./GNGC_CYBER_RANGE_WEBSITE/application.py
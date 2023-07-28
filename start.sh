echo ""
echo "Starting Database"
sudo service mysql start
echo ""
echo "Starting Webserver"
python3 ~/GNGC-CYBER-RANGE/GNGC_CYBER_RANGE_WEBSITE/application.py
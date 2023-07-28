echo ""
echo "Starting Database"
sudo service mysql start
echo ""
echo "Starting Webserver"
python3 ~/GNGC_CYBER_RANGE/GNGC_CYBER_RANGE_WEBSITE/application.py
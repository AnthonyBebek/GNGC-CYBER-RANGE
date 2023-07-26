echo "This is a python import install for all dependencies"
echo ""
read -p "Continuing in 5 seconds or press enter to continue" -t 5
echo ""
echo "\n Continuing ...."
pip3 install flask
pip3 install flask_login
pip3 install werkzeug
pip3 install sqlalchemy
pip3 install re
pip3 cache purge
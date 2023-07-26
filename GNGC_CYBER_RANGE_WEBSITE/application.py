from flask import (Flask,
 render_template, 
 url_for, 
 redirect,
session, 
flash, 
request,
abort)
from  flask_login import *
import re
import os
from werkzeug.security import generate_password_hash, check_password_hash


app = Flask(__name__, template_folder='/TEMPLATES')
app.secret_key = '32i3opr4yt94'
app.config['SESSION_PERMANANT'] = True
app.config['SESSION_TYPE'] = 'filesystem'
login_manager = LoginManager()
login_manager.init_app(app)

@app.context_processor
def utility_functions():
    def print_in_console(message):
        print (str(message))

    return dict(mdebug=print_in_console)

#Feel Free to completely rip out all this, I know this will work but you are the expert so do it your way

@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port=5000)
from flask import (Flask, render_template, request, url_for, redirect, session, flash)
from flask_login import *
from urllib.parse import urlparse, urljoin
from werkzeug.security import generate_password_hash, check_password_hash
from models import *
from database import *

'''
I wrote a script that should save you a ton of time when creating the challenge pages for the site

go into the GNGC_CYBER_RANGE_SCRIPTS folder and read the README.txt file
'''

app = Flask(__name__)
ses = SessionLocal()

@login_manager.user_loader
def load_user(userid):
    return ses.query(Users).get(userid)

def is_safe_url(target):
    ref_url = urlparse(request.host_url)
    test_url = urlparse(urljoin(request.host_url, target))
    return test_url.scheme in ('http', 'https') and \
        ref_url.netloc == test_url.netloc

@app.context_processor
def utility_functions():
    def print_in_console(message):
        print (str(message))
    
    return dict(mdebug=print_in_console)

@app.route('/')
def index():
    if current_user.is_authenticated:
        return redirect('dashboard')
    return render_template('index.html')
@app.route('/login', methods = ['POST','GET'])
def login():

    if request.method == 'POST':
        studentId = request.form['studentId']
        userPass = request.form['userPass']

        if not studentId or not userPass:
            flash('You did not enter a Username or Password')
            return redirect(url_for('login'))
        else:
            print('Both Fields were submitted')
            User = ses.query(Users).filter_by(studentId = studentId).first()

            if not User: 
                flash('Invalid Student ID or Password')
                return redirect(url_for('login'))
            if not userPass:
                flash('Invalid Student ID or Password')
            if not check_password_hash(User.userPass, userPass):
                flash('Invalid Username or Password')
                return redirect(url_for('login'))        
            
    return render_template('login.html')


if __name__ == '__main__':
    app.run()
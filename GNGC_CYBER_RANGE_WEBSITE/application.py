from flask import (Flask, render_template, request, url_for, redirect, session, flash, abort)
from flask_login import *
from urllib.parse import urlparse, urljoin
from validate_email import validate_email
import json
import os
import sys
from werkzeug.security import generate_password_hash, check_password_hash
from models import *
import random
import string

app = Flask(__name__)

#making a secret key random to randomise the CRF key
def randomstring(length):
    letters = string.ascii_lowercase
    resultstr = ''.join(random.choice(letters) for i in range(length))
    return resultstr

ses = SessionLocal()
app.secret_key = randomstring(64)
login_manager = LoginManager()
login_manager.init_app(app)
#this is to make the files work between directories
PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), os.pardir))
sys.path.append(PROJECT_ROOT)

from GNGC_CYBER_RANGE_SCRIPTS import *

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
    pageName = 'Home'
    #If the user didn't sign in they are kicked out
    if current_user.is_authenticated:
        logout_user()

    return render_template('index.html', pageName = pageName)

@app.route('/login', methods = ['POST','GET'])
def login():

    if request.method == 'POST':
        studentId = request.form['studentId']
        userPass = request.form['userPass']

        if not studentId or not userPass:
            flash('You did not enter a Username or Password')
            return redirect(url_for('login'))
        else:
            User = ses.query(Users).filter_by(studentId = studentId).first()

            if not User:
                flash('Invalid Student ID or Password')
                return redirect(url_for('login'))
            if not userPass:
                flash('Invalid Student ID or Password')
            if not check_password_hash(User.userPass, userPass):
                flash('Invalid Username or Password')
                return redirect(url_for('login'))        
            
            login_user(User)
            next = request.args.get('next')
            if not is_safe_url(next):
                return abort(400)

            session.permanent = True
            session['User'] = User.userId
            return redirect(next or url_for('dashboard'))
    return render_template('login.html')

@app.route('/signup', methods = ['POST','GET'])
def signup():
    if request.method == 'POST':
        userName = request.form['userName']
        studentId = request.form['studentId'] 
        userMail = request.form['userMail']
        userPass = request.form['userPass']
        userConfPass = request.form['userConfPass']

        if not userName or not studentId or not userPass or not userConfPass or not userMail:
            flash('A field was not entered properly, Try Again')
            return redirect(url_for('signup'))
        
        else:
            print('all fields sumbitted something')
        #I used a new method for validating emails with a function now, it might not work with schoolsnet but 
        #it should be easy to fix
        is_valid = validate_email(userMail)  
        if is_valid:
            print('Valid Email')
        else:
            print('Invalid Email')
            flash('Email was invalid')
            return redirect(url_for('signup'))
        
        if userPass != userConfPass:
            flash('Passwords were not the same... Try again')
            return redirect(url_for('signup'))
        
        hasheduserPass = generate_password_hash(userPass, method='md5')
        print('password hashed')
        
        try:
            User = Users(userName = userName, studentId = studentId, userMail = userMail, userPass = hasheduserPass)
            ses.add(User)
            ses.commit()
            print('user data added')
            return redirect(url_for('login'))
        
        except Exception as problem:
            print(problem)
            flash('Somemthing went wrong when inputting you information')
            ses.rollback()

    return render_template('signup.html')

@app.route('/logout', methods = ['POST','GET'])
@login_required
def logout():
    logout_user()
    return redirect(url_for('index'))

@app.route('/dashboard', methods = ['POST','GET'])
@login_required
def dashboard():
    user = current_user.userId
    userName = current_user.userName

    categoryList = []
    challengsfile = "./Admin_Settings.json"
    #I wanted to try something different to just using databases so I tried to use json
    #this was the first method, and the second is below. 
    with open(challengsfile, "r", encoding="utf-8") as file:
        settings = json.load(file)

    categories = settings.get('Categories')

    for category in categories:
        categoryList.append(category)
    
    return render_template('dashboard.html', userName = userName, categoryList = categoryList)

@app.route('/challenge_Dashboard/<category>', methods = ['POST','GET'])
@login_required
def challengeDash(category):

    challengeList = []
    #this is the second method which uses a script file
    challengeList = challenge_info.get_challenges(category)
    return render_template('challengeDash.html', challengeList = challengeList)

@app.route('/challenge/<challenge>', methods = ['POST','GET'])
@login_required
def challenge(challenge):
    
    challengeinf = challenge_info.get_challenge_settings(challenge)
    challengeinf = list(challengeinf.values())

    if request.method == 'POST':
        challengeAnswer = request.form['challengeAnswer']

        if challengeAnswer == challengeinf[3]:
            return redirect(url_for('correct', challenge = challenge))
        else:
            flash(challengeinf[2])

    return render_template('challenge.html', challengeinf = challengeinf)

@app.route('/correct/<challenge>', methods = ['POST','GET'])
@login_required
def correct(challenge):
    
    challenge = challenge_info.get_challenge_settings(challenge)
    challenge = list(challenge.values())
    return render_template('correct.html', challenge = challenge)

if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True)
from flask import (Flask, render_template, request, url_for, redirect, session, flash)
from models import *
from database import *

app = Flask(__name__)


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods = ['POST','GET'])
def login():

    if request.method == 'POST':
        userName = request.form['userName']
        userPass = request.form['userPass']

        if not userName or not userPass:
            flash('You did not enter a Username or Password')
            return redirect(url_for('login'))
        else:
            print('Both Fields were submitted')


    return render_template('login.html')


if __name__ == '__main__':
    app.run()
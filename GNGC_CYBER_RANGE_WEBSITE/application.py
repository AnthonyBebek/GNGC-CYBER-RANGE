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


app = Flask(__name__)
app.secret_key = 'ballers'
app.config['SESSION_PERMANANT'] = True
app.config['SESSION_TYPE'] = 'filesystem'
login_manager = LoginManager()
login_manager.init_app(app)


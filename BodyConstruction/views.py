from BodyConstruction import app
from flask import render_template,redirect, url_for, request, session, flash
from functools import wraps

app.secret_key = 'gortGORTgortGORTgortGORT_I_Like_Beans_and_Chocolate_Milk!45'

#decorator for pages requiring a login to view
def login_required(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'logged_in' in session:
            return f(*args, **kwargs)
        else:
            flash('You need to login')
            return redirect(url_for('login'))
    return wrap

#home page
@app.route('/')
@app.route('/welcome')
def welcome():
    return render_template('welcome.html',
                            title='Body Constructor')

@app.route('/index')
def index():
    return render_template('header.html',
                           title='Gort Gort')

#user home page after login
@app.route('/home')
@login_required
def home():
    return render_template('home.html',
                           title='User home base of a solid \'tude')


#function to log user in
@app.route('/login', methods=['GET','POST'])
def login():
    error = None;
    if request.method == 'POST':
        if request.form['username'] != 'admin' or request.form['password'] != 'admin':
            error = "Invalid login or password. Please try again."
        else:
            session['logged_in'] = True
            return redirect (url_for('home'))
    return render_template('login.html',
                            error = error)

#function to log user out
@app.route('/logout')
@login_required
def logout():
    session.pop('logged_in', None)
    flash('You were logged out!')
    return redirect(url_for('login'))

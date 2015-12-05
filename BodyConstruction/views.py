from BodyConstruction import app, db
from flask import render_template,redirect, url_for, request, session, flash, send_from_directory
from werkzeug.security import generate_password_hash, \
     check_password_hash
from werkzeug import secure_filename
from sqlalchemy import create_engine, MetaData, Table, select
from functools import wraps
import os

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
                           title='User home base of a solid \'tude',
                           tables=db.metadata.tables)


#function to log user in
@app.route('/login', methods=['GET','POST'])
def login():
    error = None;
    if request.method == 'POST':
        rslt = db.engine.execute("select id, username, firstname, lastname, email, IFNULL(password, '') FROM user WHERE email = '" + request.form['email'] + "'").first()
        
        # if  rslt[5] is None:  ## empty password in DB!
        if  1 is None:  ## empty password in DB!
            error = "Invalid user in database.  Please contact support."
        elif rslt is None:
            error = "User not found in database."
        elif not check_password_hash(rslt[5], request.form['password']):
            error = "Invalid login or password.  Please try again."
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

# register new users
@app.route('/register', methods=['POST','GET'])
def register():
    error = None;
    if request.method == 'POST':
        if request.form['password'] != request.form['repeat_password']:
            error = "Passwords must be the same."
        elif db.engine.execute("select count(*) FROM user WHERE email = '" + request.form['email'] + "'").first()[0] > 0:
            error = "Email already exists."
        elif db.engine.execute("select count(*) FROM user WHERE lower(username) = '" + request.form['username'].lower() + "'").first()[0] > 0:
            error = "User name already exists."
        else:
            db.engine.execute("INSERT INTO user (username,email,password) VALUES('" + request.form['username'] + "', '" + request.form['email'] + "', '" + generate_password_hash(request.form['password']) + "')")
            db.engine.execute('commit')
            flash("User " + request.form['username'] + " registered; please log in now.")
            return redirect(url_for('login'))
    return render_template('register.html', error = error)

## UPLOADS
ALLOWED_EXTENSIONS = ['png','gif','jpg','jpeg']
def allowed_file(filename):
    return '.' in filename and \
        filename.rsplit('.', 1)[1] in ALLOWED_EXTENSIONS

@login_required
@app.route('/uploadPic', methods = ['GET','POST'])
def upload_pic():
    error = None
    if request.method == 'POST':
        file = request.files['journalpic']
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            return redirect(url_for('viewpic',
                                    filename=filename))
    return render_template('uploadpic.html', error = error)

@login_required
@app.route('/viewpic/<filename>')
def viewpic(filename):
    return render_template('viewpic.html', filename=filename)

@app.route('/greg')
def phototest():
    user = db.engine.execute('select username,email FROM user WHERE id = 8').first()
    photos = db.engine.execute('select photo_uri, comment FROM journal WHERE user_id = 8 ORDER BY date_entered')
    return render_template('phototest.html',
                           photos = photos,
                           user=user)


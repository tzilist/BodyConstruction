from BodyConstruction import app
from flask import render_template

@app.route('/')
@app.route('/index')

def index():
    return render_template('header.html',
                           title='Gort Gort')
        
    return 'Hello World!'

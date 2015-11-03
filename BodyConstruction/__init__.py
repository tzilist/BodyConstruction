from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy
app = Flask(__name__)

import BodyConstruction.views

## deal with DB - is this best practice?
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqldb://gregj:dbuser@localhost/bodyconstruction'
db = SQLAlchemy(app)

metadata = db.metadata
engine = db.engine

## grab metadata for all tables!
metadata.reflect(bind = engine)
user = metadata.tables['user']
journal = metadata.tables['journal']

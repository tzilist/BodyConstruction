"""BodyConstruction web application for keeping track of body building progress"""

from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy
app = Flask(__name__)


## deal with DB - is this best practice?
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqldb://gregj:dbuser@localhost/bodyconstruction'
app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = False
db = SQLAlchemy(app)

## grab metadata for all tables!
db.metadata.reflect(bind = db.engine)
user_id = -1

import BodyConstruction.views

__version__ = "0.0.0"

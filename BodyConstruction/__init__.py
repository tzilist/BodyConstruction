"""BodyConstruction web application for keeping track of body building progress"""

from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy
import os

app = Flask(__name__)


## deal with DB - is this best practice?
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqldb://gregj:dbuser@localhost/bodyconstruction'
app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = False

app.config['DEFAULT_FILE_STORAGE'] = 'filesystem'
app.config['UPLOAD_FOLDER'] = os.path.realpath('.') + '/BodyConstruction/static/uploads'
app.config['UPLOADED_PHOTOS_ALLOW'] = set(['png', 'jpg', 'jpeg'])
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024



db = SQLAlchemy(app)

## grab metadata for all tables!
db.metadata.reflect(bind = db.engine)
user_id = -1

import BodyConstruction.views

__version__ = "0.0.0"

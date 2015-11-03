from BodyConstruction import app
from flask.ext.sqlalchemy import SQLAlchemy

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqldb://gregj:dbuser@localhost/bodyconstruction'

db = SQLAlchemy(app)

metadata = db.metadata
engine = db.engine

## grab metadata for all tables!
metadata.reflect(bind = engine)
user = metadata.tables['user']
journal = metadata.tables['journal']

print metadata.tables


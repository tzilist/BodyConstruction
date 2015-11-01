from sqlalchemy import create_engine, MetaData, Table, select

engine = create_engine('mysql+mysqldb://gregj:dbuser@localhost/bodyconstruction', echo=False)
## hold metadata/schema
metadata = MetaData(bind = engine)
## here's how we grab metadata per table
user = Table('user', metadata, autoload=True, autoload_with=engine)
journal = Table('journal', metadata, autoload=True, autoload_with=engine)
## but this is very cool: grab metadata for all tables!
metadata.reflect(bind = engine)
user = metadata.tables['user']

conn = engine.connect()
u = user.select(user.c.id == 1).execute().first()
u2 = engine.execute('select * FROM user').first()
u3 = engine.execute('select * FROM user WHERE id = :1', [1]).first()
# ins = user.insert().values(username='textme', email='a@b.c')
# result = conn.execute(ins)
## more common usage of insert
# ins = user.insert()
# conn.execute(ins, username='biteme', email='x@y.z')
# for row in conn.execute(s):
#     print row[user.c.username]
# result.close()


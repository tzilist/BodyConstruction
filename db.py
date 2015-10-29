from sqlalchemy import create_engine, MetaData, Table, select

engine = create_engine('mysql+mysqldb://gregj:dbuser@localhost/bodyconstruction', echo=False)
metadata = MetaData(bind = engine)
user = Table('user', metadata, autoload=True)
journal = Table('journal', metadata, autoload=True)
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


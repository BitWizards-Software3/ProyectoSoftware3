from sqlalchemy import create_engine, MetaData
engine = create_engine('mysql+pymysql://admin1:12345@localhost:3306/test')
meta = MetaData()
conn = engine.connect()
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

engine = create_engine('mariadb+pymysql://user:pass@some_mariadb/dbname?charset=utf8mb4')

sessionlocal = sessionmaker(autocommit = False, autoflush= False, bind=engine)

Base = declarative_base()
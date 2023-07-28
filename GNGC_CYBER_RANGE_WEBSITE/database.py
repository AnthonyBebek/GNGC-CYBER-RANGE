from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

engine = create_engine('mariadb+pymysql://root:GNGC-PASS@127.0.0.1/gngcmain?charset=utf8mb4')

sessionlocal = sessionmaker(autocommit = False, autoflush= False, bind=engine)

Base = declarative_base()
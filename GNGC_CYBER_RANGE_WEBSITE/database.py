from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

#How I connect to the mariaDB engine, this is different from sqlite since in this method it is an actual engine
#this is compared to sqlite which is essentially a formatted flat file
engine = create_engine('mariadb+pymysql://root:GNGC-PASS@127.0.0.1:3306/gngcmain?charset=utf8mb4')

#A similar method of session local was used. 
SessionLocal = sessionmaker(autocommit = False, autoflush= False, bind=engine)

Base = declarative_base()
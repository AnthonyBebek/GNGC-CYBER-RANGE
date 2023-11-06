from sqlalchemy import (String,
Column,
Boolean,
Integer)
from database import *

#Because of sqlalchemy I don't needto learn a new format for configuring the database and instead I can do it all on python. 
#this is good. 

class Users(Base):
    __tablename__ = "Users"
    userId = Column(Integer, primary_key=True, autoincrement=True, nullable=False)
    userName = Column(String(80), nullable=False)
    studentId = Column(Integer, nullable=False)
    userPass = Column(String(100), nullable=False)
    userMail  = Column(String(80), nullable=False)

    def __repr__(self):
        return f"User('{self.userName}')"

    def get_id(self):
        return str(self.userId)

    def is_authenticated(self):
        return str(self.userId)

    def is_active(self):
        return str(self.userId)

#I don't this does anything but it acts as a good base for when users want to store their progress
#this was supposed to be implimented but I just ran out of time. 
class Challenge(Base):
    __tablename__ = "Challenge"
    challengeId = Column(Integer, primary_key=True, autoincrement=True, nullable=False)
    challengeName = Column(String(250), nullable=False)
    challengeStatus = Column(Boolean, nullable = False, default = True)


Base.metadata.create_all(engine)
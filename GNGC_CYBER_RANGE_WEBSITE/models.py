from sqlalchemy import (String,
Column,
Integer,
DateTime, 
ForeignKey,
UniqueConstraint 
)
from sqlalchemy.ext.associationproxy import association_proxy
from database import *
from sqlalchemy.orm import relationship


class User(Base):

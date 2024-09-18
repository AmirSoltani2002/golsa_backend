from sqlalchemy import Column, Integer, String, ForeignKey, Boolean
from sqlalchemy.orm import relationship
from app.db import Base

class Machine(Base):
    __tablename__ = 'machines'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    machine = Column(String)
    fitting = Column(Boolean)


from sqlalchemy import Column, Integer, String, ForeignKey, Boolean
from sqlalchemy.orm import relationship
from app.db import Base

class Material(Base):
    __tablename__ = 'materials'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    material = Column(String)


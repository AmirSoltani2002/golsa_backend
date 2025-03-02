from sqlalchemy import Column, Integer, String, ForeignKey, Boolean
from sqlalchemy.orm import relationship
from app.db import Base


class RawMaterial(Base):
    __tablename__ = 'rawmaterials'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    rawmaterial = Column(String)
    company = Column(String)
    confirm = Column(Boolean, default = False)
    price = Column(Integer)

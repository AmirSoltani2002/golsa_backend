from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from app.db import Base


class RawMaterial(Base):
    __tablename__ = 'rawmaterials'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    rawmaterial = Column(String)
    company = Column(String)
    price = Column(Integer)

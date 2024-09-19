from sqlalchemy import Column, Integer, String, ForeignKey, Boolean, Float
from sqlalchemy.orm import relationship
from app.db import Base


class AllProduct(Base):
    __tablename__ = 'allproducts'

    id = Column(Integer, index=True, autoincrement=True)
    name = Column(String)
    code = Column(String, primary_key=True, index=True)


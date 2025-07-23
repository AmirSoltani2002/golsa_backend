from sqlalchemy import Column, Integer, String
from app.db import Base


class Molds(Base):
    __tablename__ = 'molds'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    mold = Column(String)






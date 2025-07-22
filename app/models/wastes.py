from sqlalchemy import Column, Integer, String
from app.db import Base


class Waste(Base):
    __tablename__ = 'wastes'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    waste_reason = Column(String)

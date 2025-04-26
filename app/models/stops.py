from sqlalchemy import Column, Integer, String, ForeignKey, Boolean, Time, Date
from sqlalchemy.orm import relationship
from app.db import Base


class Stops(Base):
    __tablename__ = 'stops'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    stop_reason = Column(String)






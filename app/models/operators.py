from sqlalchemy import Column, Integer, String, ForeignKey, Boolean
from app.db import Base


class Operator(Base):
    __tablename__ = 'operators'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    name = Column(String)
    father = Column(String)
    sex = Column(String)  # ForeignKey reference
    personal_id = Column(String)  # ForeignKey reference
    marriage = Column(Boolean)  # ForeignKey reference
    education = Column(String)  # ForeignKey reference
    major = Column(String)  # ForeignKey reference
    part = Column(String)  # ForeignKey reference
    type = Column(String)  # ForeignKey reference


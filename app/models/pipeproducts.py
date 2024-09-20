from sqlalchemy import Column, Integer, String, ForeignKey, Boolean, Float
from sqlalchemy.orm import relationship
from app.db import Base


class PipeProduct(Base):
    __tablename__ = 'pipeproduct'

    id = Column(Integer, index=True, autoincrement=True)
    name = Column(String)
    code = Column(String, primary_key=True, index=True)
    currency = Column(String)
    usage = Column(String)
    export = Column(Boolean)
    size = Column(Integer)
    tickness = Column(Integer)
    quality = Column(String)
    length = Column(Integer)
    weight = Column(String)
    color = Column(String)
    image = Column(String)


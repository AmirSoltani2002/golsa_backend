from sqlalchemy import Column, Integer, String, ForeignKey, Boolean, Float
from sqlalchemy.orm import relationship
from app.db import Base


class FittingProduct(Base):
    __tablename__ = 'fittingproduct'

    id = Column(Integer, index=True, autoincrement=True)
    name = Column(String)
    code = Column(String, primary_key=True, index=True)
    currency = Column(String)
    number_box = Column(Integer)
    number_pallet = Column(Integer)
    entity = Column(String)
    color = Column(String)
    usage = Column(String)
    model = Column(String)
    export = Column(Boolean)
    quality = Column(String)
    size = Column(Integer)
    tickness = Column(Integer)
    weight = Column(Float)
    image = Column(String)


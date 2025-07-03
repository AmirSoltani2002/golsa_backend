from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from app.db import Base
from app.models.stops import Stops
from app.models.finalProduct import FinalProduct
from app.models.operators import Operator


class StopsFinalProducts(Base):
    __tablename__ = 'stopsfinalproducts'

    id = Column(Integer, index=True, autoincrement=True, primary_key = True)
    stop_id = Column(ForeignKey('stops.id', ondelete='SET NULL'))
    finalproduct_id = Column(ForeignKey('finalproducts.id', ondelete='SET NULL'))
    operator_id = Column(ForeignKey('operators.id', ondelete='SET NULL'))
    start_date = Column(String)
    start_time = Column(String)
    end_date = Column(String)
    end_time = Column(String)
    description = Column(String)

    stop = relationship("Stops", backref="stopsfinalproducts")
    finalproduct = relationship("FinalProduct", backref="stopsfinalproducts")
    operator = relationship("Operator", backref="stopsfinalproducts")


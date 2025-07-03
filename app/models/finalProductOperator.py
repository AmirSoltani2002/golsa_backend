from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from app.db import Base
from app.models.operators import Operator
from app.models.finalProduct import FinalProduct

class FinalProductOperator(Base):
    __tablename__ = 'finalproductoperators'

    id = Column(Integer, index=True, autoincrement=True, primary_key = True)
    finalproduct_id = Column(ForeignKey('finalproducts.id', ondelete='SET NULL'))
    cycle_practical = Column(Integer)
    cycle_description = Column(String)
    operator_id = Column(ForeignKey('operators.id', ondelete='SET NULL'))
    start_date = Column(String)
    start_time = Column(String)
    end_date = Column(String)
    end_time = Column(String)
    shift = Column(Integer)
    quantity_practical = Column(Integer)
    waste = Column(Integer)
    waste_description = Column(String)

    operator = relationship("Operator", backref="finalproductoperator")
    finalproduct = relationship("FinalProduct", backref="finalproductoperator")
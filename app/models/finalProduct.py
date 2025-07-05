from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from app.db import Base
from app.models.machines import Machine
from app.models.allproducts import AllProduct
from app.models.operators import Operator


class FinalProduct(Base):
    __tablename__ = 'finalproducts'

    id = Column(Integer, index=True, autoincrement=True, primary_key = True)
    line_id = Column(ForeignKey('machines.id', ondelete='SET NULL'))
    mold = Column(String)
    product_id = Column(ForeignKey('allproducts.code', ondelete='SET NULL'))
    type = Column(String)
    cycle_tobe = Column(Integer)
    quantity_tobe = Column(Integer)

    machine = relationship("Machine", backref="finalproducts")
    product = relationship("AllProduct", backref="finalproducts")


from sqlalchemy import Column, Integer, String, ForeignKey, Boolean, Time, Date
from sqlalchemy.orm import relationship
from app.db import Base
from app.models.operators import Operator  # Import Operator before MixEntry
from app.models.machines import Machine
from app.models.materials import Material
from app.models.rawmaterials import RawMaterial
from app.models.allproducts import AllProduct 


class MixEntry(Base):
    __tablename__ = 'mixentries'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    operator_id = Column(ForeignKey('operators.id', ondelete='SET NULL'))
    shift = Column(Integer)
    line_id = Column(ForeignKey('machines.id', ondelete='SET NULL'))
    product_id = Column(ForeignKey('allproducts.code' , ondelete='SET NULL'))
    description = Column(String)
    recipe_code = Column(ForeignKey('materials.id', ondelete='SET NULL'))
    #mix_name = Column(ForeignKey('materials.id', ondelete='SET NULL'))
    date = Column(String)
    category = Column(String)
    amount = Column(Integer)
    stop_id = Column(ForeignKey('stops.id', ondelete='SET NULL'))
    stop_time = Column(Integer)
    time = Column(Integer)
    mainstat = Column(Boolean, default=True)

    product = relationship("AllProduct", backref="mixentries")
    operator = relationship("Operator", backref="mixentries")
    machine = relationship("Machine", backref="mixentries")
    stop = relationship("Stops", backref="mixentries")






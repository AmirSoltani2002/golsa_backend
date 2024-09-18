from sqlalchemy import Column, Integer, String, ForeignKey, Boolean, Time, Date
from sqlalchemy.orm import relationship
from app.db import Base
from app.models.operators import Operator  # Import Operator before MixEntry
from app.models.machines import Machine
from app.models.materials import Material
from app.models.rawmaterials import RawMaterial


class MixEntry(Base):
    __tablename__ = 'mixentries'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    operator_id = Column(ForeignKey('operators.id'))
    shift = Column(Integer)
    line_id = Column(ForeignKey('machines.id'))
    product_id = Column(Integer)
    description = Column(String)
    recipe_code = Column(ForeignKey('recipes.id'))
    time = Column(Time)
    date = Column(Date)
    fitting = Column(Boolean)

    operator = relationship("Operator", backref="mixentries")
    machine = relationship("Machine", backref="mixentries")
    recipe = relationship("Recipe", backref="mixentries")





